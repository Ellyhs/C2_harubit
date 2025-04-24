//
//  HarubitV3App.swift
//  HarubitV3
//
//  Created by ellllly on 4/21/25.
//

import SwiftUI
import SwiftData

@main
struct HarubitV3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: GratitudeCard.self, onSetup: { result in
            do {
                let container = try result.get()
                let context = container.mainContext
                
                let existing = try context.fetch(FetchDescriptor<GratitudeCard>())
                if existing.isEmpty {
                    let sample = [
                        GratitudeCard(date: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, content: "오늘 커피가 너무 맛있었다 ☕️"),
                        GratitudeCard(date: .now.addingTimeInterval(-86400 * 2), content: "친절한 사람을 만나서 기뻤다 😊"),
                        GratitudeCard(date: .now.addingTimeInterval(-86400 * 3), content: "좋은 책을 읽고 마음이 편안했다 📖"),
                        GratitudeCard(date: Calendar.current.date(byAdding: .year, value: -2, to: Date())!, content: "오늘 저녁이 너무 맛있었다 ☕️")
                    ]
                    for samp in sample {
                        context.insert(samp)
                    }
                    try context.save()
                }
            } catch {
                print("SwiftData 초기화 실패: \(error.localizedDescription)")
            }
        })
    }
}
