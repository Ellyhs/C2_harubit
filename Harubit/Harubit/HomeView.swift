//
//  HomeView.swift
//  Harubit
//
//  Created by ellllly on 4/16/25.
//

import SwiftUI

struct HomeView: View {
    @State private var today = Date()
    
    
    
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
                        Text(getFormatteredDate(form: "MM"))
                            .font(.largeTitle)
                        Text(getFormatteredDate(form: "EEE"))
                    }
                    .foregroundColor(.white)
                    Text(getFormatteredDate(form: "dd"))
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                        .foregroundStyle(.white)
                    Button("GoWrite", systemImage: "square.and.pencil") {
//                        WriteView()
                        print("")
                    }
//                    .frame(width: 30, height: 50)
                    .labelStyle(.iconOnly)
                    .font(.title)
                    
                }

            }
            
        }
    }
    
    func getFormatteredDate(form: String) -> String {
        let today = Date()
        let formatter = DateFormatter()
      
        formatter.dateFormat = form
        
        return formatter.string(from: today)
    }
    
    
}

#Preview {
    HomeView()
}
