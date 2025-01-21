/*
 FlexibleVStack.swift
 FlexibleStack

 Created by Takuto Nakamura on 2023/12/01.
*/

import SwiftUI

public struct FlexibleVStack: Layout {
    let alignment: BoxAlignment
    let spacing: CGFloat

    public init(alignment: BoxAlignment = .center, spacing: CGFloat = 8) {
        self.alignment = alignment
        self.spacing = spacing
    }

    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    private func aspectRatio(of subviews: Subviews) -> CGFloat {
        let maxSize = subviews.reduce(CGSize.zero) { partialResult, subview in
            let size = subview.sizeThatFits(.unspecified)
            return CGSize(
                width: max(partialResult.width, size.width),
                height: max(partialResult.height, size.height)
            )
        }
        return maxSize.width / maxSize.height
    }

    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        let parentAspectRatio = bounds.width / bounds.height
        let count = subviews.count
        let subviewAspectRatio = aspectRatio(of: subviews)
        guard parentAspectRatio * subviewAspectRatio != .zero else { return }

        let ratios = (.zero ..< count).map { index in
            let bottom = CGFloat(count - index)
            let top = ceil(CGFloat(count) / bottom)
            return subviewAspectRatio * top / bottom
        }
        let index = ratios.map { abs(parentAspectRatio - $0) }
            .enumerated()
            .min { $0.element < $1.element }?
            .offset ?? .zero
        let rowsCount = (count - index)
        let vCount = CGFloat(rowsCount)
        let hCount = ceil(CGFloat(count) / vCount)

        let w = (bounds.width - (hCount - 1) * spacing) / hCount
        let h = (bounds.height - (vCount - 1) * spacing) / vCount
        let idealSize = if subviewAspectRatio < (w / h) {
            CGSize(width: subviewAspectRatio * h, height: h)
        } else {
            CGSize(width: w, height: w / subviewAspectRatio)
        }
        let offset = alignment.offset(with: CGSize(
            width: hCount * (w - idealSize.width) + idealSize.width,
            height: vCount * (h - idealSize.height) + idealSize.height
        ))
        let origin = CGSize(
            width: bounds.minX + offset.width,
            height: bounds.minY + offset.height
        )
        subviews.indices.forEach { index in
            let x = origin.width + CGFloat(index / rowsCount) * (idealSize.width + spacing)
            let y = origin.height + CGFloat(index % rowsCount) * (idealSize.height + spacing)
            subviews[index].place(
                at: CGPoint(x: x, y: y),
                anchor: alignment.anchor,
                proposal: ProposedViewSize(idealSize)
            )
        }
    }
}
