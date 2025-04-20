//
//  WriteView.swift
//  Harubit
//
//  Created by ellllly on 4/16/25.
//
import SwiftUI
import SwiftData

struct WriteView: View {
    @Query private var harubitNote: [HarubitNote]
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var didFinishFirstEntry = false
    @State private var content: String = ""
    @State private var createdDate: Date = Date.now
    
    var body: some View {
        
        if didFinishFirstEntry {
            RecordDetailView()
        } else {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                    }
                    .foregroundStyle(.accent)
                    
                    ZStack(alignment: .topLeading){
                        TextEditor(text: $content)
                            .padding(20)
                            .scrollContentBackground(.hidden)
                            .background(.clear)
                            .foregroundColor(.white)
                        
                        if content.isEmpty {
                            Text("오늘의 감사한 순간을 작성해주세요")
                                .foregroundColor(.gray)
                                .padding(20)
                                .padding(.vertical, 12)
                        }
                    }
                    Spacer()
                }
                .navigationBarItems(trailing: Button("완료") {
                    let contentSet = HarubitNote(content: content)
                    context.insert(contentSet)
                                                        
                    didFinishFirstEntry = true
                })
            }
        }
    }
}

#Preview {
    WriteView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
