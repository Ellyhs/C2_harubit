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
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("감사의 순간들이 모여 하루의 빛이 됩니다.")
                        .padding([.bottom], 50)
                        .font(.title3)
                        .foregroundColor(.accent)
                        .frame(width:200)
                        .multilineTextAlignment(.center)
                    
//                    HStack(alignment: .center) {
//                        Text(recordManger.getFormattedDate(form: "MM"))
//                            .font(.largeTitle)
//                        Text(recordManger.getFormattedDate(form: "EEE"))
//                    }
//                    .foregroundColor(.white)
//                    
//                    Text(recordManger.getFormattedDate(form: "dd"))
//                        .font(.largeTitle)
//                        .padding(.bottom, 20)
//                        .foregroundStyle(.white)
//
                    if hasWrittenToday {
                        NavigationLink(destination: RecordDetailView()) {
                            Image(systemName: "list.bullet.rectangle.portrait")
                                .resizable()
                                .frame(width:80, height:80)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .labelStyle(.iconOnly)
                        .font(.title)
                    } else {
                        NavigationLink(destination: WriteView()) {
                            Image(systemName: "square.and.pencil")
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
