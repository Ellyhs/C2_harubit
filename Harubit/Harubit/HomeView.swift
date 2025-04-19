//
//  HomeView.swift
//  Harubit
//
//  Created by ellllly on 4/16/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var recordManger = RecordManager()

    var body: some View {
        NavigationStack {
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("감사의 순간들이 모여 하루의 빛이 됩니다.")
                        .padding([.bottom], 100)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(alignment: .center) {
                        Text(recordManger.getFormattedDate(form: "MM"))
                            .font(.largeTitle)
                        Text(recordManger.getFormattedDate(form: "EEE"))
                    }
                    .foregroundColor(.white)
                    
                    Text(recordManger.getFormattedDate(form: "dd"))
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                        .foregroundStyle(.white)
                    
                    NavigationLink(destination: WriteView()) {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width:80, height:80)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
//                    .frame(width: 30, height: 50)
                    .labelStyle(.iconOnly)
                    .font(.title)
                    
                }

            }
            
        }
    }
    
    
    
    
}

#Preview {
    HomeView()
}
