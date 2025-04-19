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
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action:{
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding()
                    })
                    
                    .labelStyle(.iconOnly)
                    .padding(20)
                    
                    Spacer()
                    
                    Button("완료") {
                        let contentSet = HarubitNote(content: content, createdDate: createdDate)
                        context.insert(contentSet)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Error saving context: \(error)")
                        }
                        
                        content = ""
                        createdDate = .now
                    }
                    .padding(20)
                }
                .foregroundStyle(.white)
                
                ZStack(alignment: .topLeading){
                    TextEditor(text: $content)
                        .padding(20)
                        .scrollContentBackground(.hidden)
                        .background(.clear)
                        .foregroundColor(.white)
                    
                    if content.isEmpty {
                        Text("오늘의 감사한 순간을 작성해주세요")
                            .foregroundColor(.white)
                            .padding(20)
                            .padding(.vertical, 12)
                    }
                    
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    WriteView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
