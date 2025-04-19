//
//  RecordDetailView.swift
//  Harubit
//
//  Created by ellllly on 4/19/25.
//

import SwiftUI
import SwiftData

struct RecordDetailView: View {
    @Query private var harubitNote: [HarubitNote]
    
    @State private var date = Date.now
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("감사일기장")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(50)
                    .foregroundColor(.accentColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Count: \(harubitNote.count)")
                    .foregroundColor(.white)
                
                List(harubitNote) {note in
                    HStack {
                        Text("안녕")//note.content)
                            .foregroundColor(.black) //Spacer()
                        Text(note.createdDate, format: .dateTime.month().day().year())
                    }
                }
//                .listStyle()
//                .scrollContentBackground(.hidden)
//                .background(Color(.systemGray6))
                
                Spacer()
                
                
            }
            .background(Color.black)
        }
    }
}
#Preview {
    RecordDetailView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
