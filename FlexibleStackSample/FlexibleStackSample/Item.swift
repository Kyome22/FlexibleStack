/*
 Item.swift
 FlexibleStackSample

 Created by Takuto Nakamura on 2023/12/01.
*/

import SwiftUI

struct Item: Identifiable {
    var id: UUID = .init()
    var value: String
    var color: Color
}
