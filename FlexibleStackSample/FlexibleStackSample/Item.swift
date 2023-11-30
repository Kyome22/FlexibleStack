/*
 Item.swift
 FlexibleStackSample

 Created by Takuto Nakamura on 2023/12/01.
*/

import SwiftUI

struct Item: Identifiable {
    let id: UUID = .init()
    let value: String
    let color: Color
}
