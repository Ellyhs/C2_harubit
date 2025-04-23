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
        }
        .modelContainer(for: HarubitNote.self, onSetup: { result in
            do {
                let container = try result.get() // ✅ Result에서 꺼냄
                let context = container.mainContext // ✅ 여기서 mainContext 사용

                let existing = try context.fetch(FetchDescriptor<HarubitNote>())
                if existing.isEmpty {
                    let sampleNotes = [
                        HarubitNote(content: "오늘 커피가 너무 맛있었다 ☕️", createdDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!),
                        HarubitNote(content: "친절한 사람을 만나서 기뻤다 😊", createdDate: .now.addingTimeInterval(-86400 * 2)),
                        HarubitNote(content: "좋은 책을 읽고 마음이 편안했다 📖", createdDate: .now.addingTimeInterval(-86400 * 3)),
                        
                        HarubitNote(content: "오늘 저녁이 너무 맛있었다 ☕️", createdDate: Calendar.current.date(byAdding: .year, value: -2, to: Date())!)
                    ]
                    for note in sampleNotes {
                        context.insert(note)
                    }
                    try context.save()
                }
            } catch {
                print("🛠️ SwiftData 초기화 실패: \(error.localizedDescription)")
            }
        })
    }
}
