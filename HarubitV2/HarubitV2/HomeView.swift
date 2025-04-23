//
//  HomeView.swift
//  HarubitV2
//
//  Created by ellllly on 4/20/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @StateObject var recordManger = RecordManager()
    @Query private var harubitNote: [HarubitNote]
    
    var body: some View {
        NavigationStack {
            ZStack{
                // 배경화면
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                // 애니메이션 추가 필요
                VStack {
                    Text("감사의 순간들이 모여 하루의 빛이 됩니다.")
                        .padding([.bottom], 50)
                        .font(.title3)
                        .foregroundColor(.accent)
                        .frame(width:200)
                        .multilineTextAlignment(.center)
                    
                    // 시간이 지나면 보라색으로 변하도록 수정
                    if hasWrittenToday {
                        NavigationLink(destination: RecordDetailView()) {
                            Image(systemName: "list.bullet.rectangle.portrait") //오늘 일기가 작성되었으면 RecordDetailView 보여줌
                                .resizable()
                                .frame(width:80, height:80)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .labelStyle(.iconOnly)
                        .font(.title)
                    } else {
                        NavigationLink(destination: WriteView(editingNote: nil)) {
                            Image(systemName: "square.and.pencil") //오늘 일기가 작성되지 않았을 때 WriteView 보여줌
                                .resizable()
                                .frame(width:80, height:80)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .labelStyle(.iconOnly)
                        .font(.title)
                    }
                    
                    

                    
                    
                }

            }
            
        }
    }
    private var hasWrittenToday: Bool {
        harubitNote.contains {
            Calendar.current.isDateInToday($0.createdDate)
        
        }
    }
    
    
    
}

#Preview {
    HomeView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
