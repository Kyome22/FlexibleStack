/*
 BoxAlignment+Extension.swift
 FlexibleStackSample

 Created by Takuto Nakamura on 2023/12/03.
*/

import SwiftUI
import FlexibleStack

extension BoxAlignment: Identifiable {
    public var id: Int { rawValue }

    var label: String {
        switch self {
        case .topLeading:     return "Top Leading"
        case .top:            return "Top"
        case .topTrailing:    return "Top Trailing"
        case .leading:        return "Leading"
        case .center:         return "Center"
        case .trailing:       return "Trailing"
        case .bottomLeading:  return "Bottom Leading"
        case .bottom:         return "Bottom"
        case .bottomTrailing: return "Bottom Trailing"
        }
    }
}
