//
//  RecordDetailView.swift
//  Harubit
//
//  Created by ellllly on 4/19/25.
//

import SwiftUI
import SwiftData

struct RecordDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var harubitNote: [HarubitNote]
    
    @State private var editingNote: HarubitNote?
    @State private var isEditing = false
    
    @State private var noteToDelete: HarubitNote?
    @State private var showDeleteAlert = false
    
//    @State private var edit
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Text("감사일기장")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(30)
                        .foregroundColor(.accentColor)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    List{
                        ForEach(harubitNote) {note in
                            NavigationLink(destination: RecordView(selectedDate: note.createdDate)) {
                                HStack {
                                    Text(note.content.count > 12 ? "\(note.content.prefix(12))..." : note.content)
                                        .font(.headline)
                                    Spacer()
                                    Text(note.createdDate, format: .dateTime.month(.wide).day().year())
                                        .foregroundColor(.secondary)
                                        .font(.caption)
                                }
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    noteToDelete = note
                                    showDeleteAlert = true
                                } label: {
                                    Label("삭제", systemImage: "trash")
                                }
                                
                                Button {
                                    editingNote = note
                                    isEditing = true
                                } label: {
                                    Label("수정", systemImage: "pencil")
                                }
                                .tint(.blue)
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.3))
                    .scrollContentBackground(.hidden)
                    //                .background(Color.white.opacity(0.2))
                    
                    Spacer()
                }
            }
        }
        
        .sheet(isPresented: $isEditing) {
            if let note = editingNote {
                WriteView(noteToEdit: note)
            }
        }
        .alert("따뜻한 기록이 사라질 수 있어요. 정말 삭제할까요?🥲", isPresented: $showDeleteAlert, actions: {
            Button("삭제", role: .destructive) {
                if let note = noteToDelete {
                    delete(note)
                    noteToDelete = nil
                }
            }
            Button("취소", role: .cancel) {
                noteToDelete = nil
            }
        }, message: {
            Text("삭제된 일기는 복구할 수 없습니다.")
        })
    }
    
    private func delete(_ note: HarubitNote) {
        modelContext.delete(note)
        try? modelContext.save()
    }
    
}
#Preview {
    RecordDetailView()
}
