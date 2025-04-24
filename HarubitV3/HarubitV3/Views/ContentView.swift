//
//  ContentView.swift
//  HarubitV3
//
//  Created by ellllly on 4/21/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        HomeView(selectedDate: Date())
    }
    
}


#Preview {
    ContentView()
        .modelContainer(for: GratitudeCard.self)
}

