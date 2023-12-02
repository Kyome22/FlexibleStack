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
        case .topLeading:     return .topLeading
        case .top:            return .top
        case .topTrailing:    return .topTrailing
        case .leading:        return .leading
        case .center:         return .center
        case .trailing:       return .trailing
        case .bottomLeading:  return .bottomLeading
        case .bottom:         return .bottom
        case .bottomTrailing: return .bottomTrailing
        }
    }

    func offset(with diff: CGSize) -> CGSize {
        let s = 0.5 * CGFloat(rawValue % 3)
        let t = 0.5 * CGFloat(rawValue / 3)
        return CGSize(width: s * diff.width, height: t * diff.height)
    }
}
