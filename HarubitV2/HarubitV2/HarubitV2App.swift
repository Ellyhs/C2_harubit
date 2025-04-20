//
//  HarubitV2App.swift
//  HarubitV2
//
//  Created by ellllly on 4/20/25.
//

import SwiftUI
import SwiftData

@main
struct HarubitV2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: HarubitNote.self)
        }
    }
}
