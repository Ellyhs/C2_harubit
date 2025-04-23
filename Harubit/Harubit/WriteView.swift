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
    
    var noteToEdit: HarubitNote?
    
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
//                .navigationBarItems(trailing: Button("완료") {
//                    if let note = noteToEdit {
//                        note.content = content
//                        try? context.save()
//                    } else {
//                        let newNote = HarubitNote(content: content)
//                        context.insert(newNote)
//                        try? context.save()
//                    }
//                                                        
//                    didFinishFirstEntry = true
//                }
//                    .disabled(content.isEmpty))
            }
//            .navigationTitle(noteToEdit == nil ? "감사 일기 작성" : "일기 수정")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("완료") {
                        if let note = noteToEdit {
                            // 수정
                            note.content = content
                            try? context.save()
                        } else {
                            // 작성
                            let newNote = HarubitNote(content: content, createdDate: createdDate)
                            context.insert(newNote)
                            try? context.save()
                        }
                        didFinishFirstEntry = true
                    }
                    .disabled(content.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let note = noteToEdit {
                    content = note.content
                    createdDate = note.createdDate
                }
            }
        }
    }
}

#Preview {
    WriteView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
