/*
 BoxAlignment+Extension.swift
 FlexibleStackSample

 Created by Takuto Nakamura on 2023/12/03.
*/

import SwiftUI
import FlexibleStack

extension BoxAlignment: @retroactive Identifiable {
    public var id: Int { rawValue }

    var label: String {
        switch self {
        case .topLeading:     "Top Leading"
        case .top:            "Top"
        case .topTrailing:    "Top Trailing"
        case .leading:        "Leading"
        case .center:         "Center"
        case .trailing:       "Trailing"
        case .bottomLeading:  "Bottom Leading"
        case .bottom:         "Bottom"
        case .bottomTrailing: "Bottom Trailing"
        }
    }
}
