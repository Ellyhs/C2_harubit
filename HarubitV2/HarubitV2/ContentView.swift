//
//  ContentView.swift
//  HarubitV2
//
//  Created by ellllly on 4/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            WriteView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}

