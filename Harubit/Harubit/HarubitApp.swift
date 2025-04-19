//
//  HarubitApp.swift
//  Harubit
//
//  Created by ellllly on 4/15/25.
//

import SwiftUI
import SwiftData

@main
struct HarubitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: HarubitNote.self)
        }
    }
}
