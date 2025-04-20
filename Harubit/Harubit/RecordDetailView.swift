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
    
    var body: some View {
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
                
                List(harubitNote) {note in
                    HStack {
                        Text(note.content)
//                            .foregroundColor(.white)
                        Spacer()
                        Text(note.createdDate, format: .dateTime.month(.wide).day().year())
//                            .foregroundStyle(.white)
                    }
                }
                .listRowBackground(Color.white.opacity(0.3))
                .scrollContentBackground(.hidden)
//                .background(Color.white.opacity(0.2))
                
                Spacer()
            }
        }
    }
}
#Preview {
    RecordDetailView()
}
