//
//  Untitled.swift
//  Harubit
//
//  Created by ellllly on 4/16/25.
//

import SwiftUI

struct ColorDetail: View {
    var color: Color


    var body: some View {
        color.navigationTitle(color.description)
    }
}
