//
//  RecordDetailView.swift
//  HarubitV2
//
//  Created by ellllly on 4/20/25.
//

import SwiftUI
import SwiftData


struct RecordDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var harubitNote: [HarubitNote]
    
    @State private var editingNote: HarubitNote?
    @State private var showEditView = false
    
    @State private var noteToDelete: HarubitNote?
    @State private var showDeleteAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("감사 일기장")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .foregroundColor(.accentColor)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    //                    List(harubitNote) {note in
                    //                        HStack {
                    //                            Text(note.content.count > 12 ? "\(note.content.prefix(12))..." : note.content)
                    //                                .font(.headline)
                    //                            Spacer()
                    //                            Text(note.createdDate, format: .dateTime.month(.wide).day().year())
                    //                                .foregroundColor(.secondary)
                    //                                .font(.caption)
                    //                        }
                    //                    }
                    //                    .listRowBackground(Color.white)
                    //                    .scrollContentBackground(.hidden)
                    //                    .background(Color.white.opacity(0.2))
                    List{
                        ForEach(harubitNote) { note in
                            NavigationLink(destination: RecordView(selectedDate: note.createdDate)) {
                                HStack {
                                    Text(note.content.count > 12 ? "\(note.content.prefix(12))..." : note.content)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(note.createdDate, format: .dateTime.month(.wide).day().year())
                                        .foregroundColor(.white.opacity(0.7))
                                        .font(.caption)
                                }
                            }
                            .listRowBackground(Color.white.opacity(0.3))
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    noteToDelete = note
                                    showDeleteAlert = true
                                } label: {
                                    Label("삭제", systemImage: "trash")
                                }
                                
                                Button {
                                    editingNote = note
                                } label: {
                                    Label("수정", systemImage: "pencil")
                                }
                                .tint(.blue)
//                                Button {
//                                    editingNote = note
//                                    showEditView = true
//                                    
//                                } label: {
//                                    Label("수정", systemImage: "pencil")
//                                }
//                                .tint(.blue)
////                                .disabled(note.content.isEmpty)
                            }
                        }
                    }
//                    .listRowBackground(Color.white.opacity(0.3))
                    .scrollContentBackground(.hidden)
//                    .background(Color.white.opacity(0.2))
                }
                
//                NavigationLink(
//                    destination: {
//                        if let note = editingNote {
//                            WriteView(editingNote: note)
//                        }
//                    },
//                    isActive:$showEditView,
//                    label: {EmptyView()}
//                )
            }
        }
//        .sheet(isPresented: $showEditView) {
//            WriteView(editingNote: editingNote)
//        }
        
        .sheet(item: $editingNote) { note in
            WriteView(editingNote: note)
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
//        .sheet(isPresented: $showEditView) {
//            WriteView(editingNote: editingNote)
//        }
    }
    
    private func delete(_ note: HarubitNote) {
        modelContext.delete(note)
        try? modelContext.save()
    }
}

//#Preview {
//    RecordDetailView()
//}
