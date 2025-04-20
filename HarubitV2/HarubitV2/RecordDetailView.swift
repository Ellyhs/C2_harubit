//
//  RecordDetailView.swift
//  HarubitV2
//
//  Created by ellllly on 4/20/25.
//

import SwiftUI
import SwiftData


struct RecordDetailView: View {
    @Query private var harubitNote: [HarubitNote]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("감사 일기장")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(50)
                        .foregroundColor(.accentColor)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    List(harubitNote) {note in
                        HStack {
                            Text(note.content.count > 12 ? "\(note.content.prefix(12))..." : note.content)
                                .font(.headline)
                            Spacer()
                            Text(note.createdDate, format: .dateTime.month(.wide).day().year())
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                    .listRowBackground(Color.white)
                    .scrollContentBackground(.hidden)
                    .background(Color.white.opacity(0.2))
                }
            }
        }
    }
}

#Preview {
    RecordDetailView()
}
