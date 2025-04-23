//
//  HomeView.swift
//  Harubit
//
//  Created by ellllly on 4/16/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @StateObject var recordManger = RecordManager()
    @State private var iconColor: Color = .white
    @State private var progress: CGFloat = 0

    var body: some View {
        NavigationStack {
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack() {
                    ZStack{
                        
                        Text("감사의 순간들이 모여 하루의 빛이 됩니다.")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.accent)
                            .opacity(Double(1 - progress))
//                            .padding(.top, 120)
                        // 보라색 스며들기 + 마스킹
                        Text("감사의 순간들이 모여 하루의 빛이 됩니다.")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.accent)
                            .opacity(Double(progress))
//                            .padding(.top, 120)
                            .mask(
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .frame(width: 0, height: 0)
                                    .scaleEffect(1)
                            )
                    }
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
                    
                    NavigationLink(destination: WriteView()) {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width:100, height:100)
                            .foregroundColor(iconColor)
                    }
//                    .frame(width: 30, height: 50)
                    .labelStyle(.iconOnly)
                    .font(.title)
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 3)) {
                    progress = 1
                    iconColor = .accent
                }
            }
            
        }
    }
    
    
    
    
}

#Preview {
    HomeView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
