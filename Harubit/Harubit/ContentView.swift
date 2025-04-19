//
//  ContentView.swift
//  Harubit
//
//  Created by ellllly on 4/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        HomeView()
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
