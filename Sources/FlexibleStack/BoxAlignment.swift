/*
 BoxAlignment.swift
 FlexibleStack

 Created by Takuto Nakamura on 2023/12/01.
*/

import SwiftUI

public enum BoxAlignment: Int, CaseIterable {
    case topLeading
    case top
    case topTrailing
    case leading
    case center
    case trailing
    case bottomLeading
    case bottom
    case bottomTrailing

    var anchor: UnitPoint {
        switch self {
        case .topLeading:     .topLeading
        case .top:            .top
        case .topTrailing:    .topTrailing
        case .leading:        .leading
        case .center:         .center
        case .trailing:       .trailing
        case .bottomLeading:  .bottomLeading
        case .bottom:         .bottom
        case .bottomTrailing: .bottomTrailing
        }
    }

    func offset(with diff: CGSize) -> CGSize {
        let s = 0.5 * CGFloat(rawValue % 3)
        let t = 0.5 * CGFloat(rawValue / 3)
        return CGSize(width: s * diff.width, height: t * diff.height)
    }
}
