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
    
    @State private var content: String = ""
    @State private var createdDate: Date = Date.now
    
    let editingNote: HarubitNote?
    
    init(editingNote: HarubitNote?) {
        self.editingNote = editingNote
        _content = State(initialValue: editingNote?.content ?? "")
        _createdDate = State(initialValue: editingNote?.createdDate ?? Date.now)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
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
                    if let note = editingNote {
                        note.content = content
                        note.createdDate = createdDate
                    } else {
                        let newNote = HarubitNote(content: content, createdDate: createdDate)
                        context.insert(newNote)
                    }
                    try? context.save()
                    dismiss()
                }
                .disabled(content.isEmpty))
            }
        }
    }
}

#Preview {
    WriteView(editingNote: HarubitNote(content: "", createdDate: Date()))
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
