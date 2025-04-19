//
//  WriteView.swift
//  Harubit
//
//  Created by ellllly on 4/16/25.
//
import SwiftUI

struct WriteView: View {
    @State private var txt: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Button("뒤로", systemImage: "arrow.left") {
                            print("")
                        }
                        .labelStyle(.iconOnly)
                        .padding(20)
                        
                        Spacer()
                        
                        Button("완료") {
                            print("")
                        }
                        .padding(20)
                     }
                                 
                    .foregroundStyle(.white)
                    
                    TextField("오늘의 감사한 순간을 적어주세요", text: $txt)
                        .padding([.leading, .top], 50)
                        .foregroundStyle(.white)
                        
                        
                    Spacer()
                }
                
            }
        }
        
    }
}

#Preview {
    WriteView()
}
