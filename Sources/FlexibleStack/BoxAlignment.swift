/*
 BoxAlignment.swift
 FlexibleStack

 Created by Takuto Nakamura on 2023/12/01.
*/

import CoreGraphics

public enum BoxAlignment: Int {
    case topLeading
    case top
    case topTrailing
    case leading
    case center
    case trailing
    case bottomLeading
    case bottom
    case bottomTrailing

    func offset(with diff: CGSize) -> CGSize {
        let s = 0.5 * CGFloat(rawValue % 3)
        let t = 0.5 * CGFloat(rawValue / 3)
        return CGSize(width: s * diff.width, height: t * diff.height)
    }
}
