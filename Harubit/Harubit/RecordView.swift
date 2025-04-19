//
//  RecordView.swift
//  Harubit
//
//  Created by ellllly on 4/19/25.
//

import SwiftUI

struct RecordView: View {
    @StateObject var recordManger = RecordManager()
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("오늘의 감사일기")
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.top, 100)
                    .foregroundColor(.white)
                
                Text("\(recordManger.getFormattedDate(form: "MM"))월 \(recordManger.getFormattedDate(form: "dd"))일")
                    .padding(.top, 10)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
                VStack{
//                    Button(action:{
//                        
//                    }, label: {
//                        Image("ellipsis")
//                    })
                    
                    ScrollView {
                        Text("dhdh")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding(50)
                            .foregroundColor(.white)
                            .frame(width:350, alignment:.leading)
                        
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(UIColor.white).opacity(0.2)))
        
                
//                        .fill(Color).gray)
                    
                    
                
                Spacer()
                
                
            }
            

        }
        
    }
}

#Preview {
    RecordView()
}
