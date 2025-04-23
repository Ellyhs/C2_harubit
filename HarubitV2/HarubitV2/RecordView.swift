//
//  RecordView.swift
//  Harubit
//
//  Created by ellllly on 4/19/25.
//

import SwiftUI
import SwiftData

struct RecordView: View {
    @StateObject var recordManger = RecordManager()
    @Query private var harubitNote: [HarubitNote]
    
    @State private var didFinishFirstEntry = false
    @State private var content: String = ""
    @State private var createdDate: Date = Date.now

    var selectedDate: Date
    
    @State private var currentIndex: Int = 2
    
    let localQuotes = [
        "감사는 마음에서 나오는 기쁨이다. – 윌리엄 아서 워드",
        "감사는 우리가 받은 모든 것에 대해 깊이 감사하는 마음이다. – 존 F. 케네디",
        "감사는 나의 삶을 채우는 기쁨이다. 감사함으로 모든 것을 바라보면 세상은 아름다워진다. – 마야 안젤루",
        "감사는 행복의 열쇠이다. 감사하지 않으면 아무리 많은 것을 가져도 행복할 수 없다. – 윌리엄 블레이크",
        "우리가 감사할 때, 우리는 주위의 모든 좋은 것들을 끌어당긴다. – 루이자 메이 올콧",
        "감사하는 마음은 가장 큰 행복을 가져온다. – 헬렌 켈러",
        "감사는 사람을 더욱 강하게 만든다. 우리가 가진 것에 감사함으로써, 우리는 더 많은 것을 얻을 수 있다. – 조지 워싱턴",
        "우리가 가진 것을 감사할 줄 아는 것이 진정한 부유함이다. – 미하일 바흐친",
        "감사는 단순히 마음에서 나오는 것이 아니라, 행동으로 이어져야 한다. – 윌리엄 아더 워드",
        "하루 하루를 감사함으로 살아간다면, 내일은 더욱 빛날 것이다. – 존 우든"
    ]
    
    var pages: [String] {
            let currentYear = Calendar.current.component(.year, from: selectedDate)
            return [String(currentYear - 2), String(currentYear - 1), String(currentYear)]
        }
 
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
                    .font(.title2)
               
                Text("\(recordManger.getFormattedDate(form: "yyyy.MM.dd"))")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text("\(recordManger.getFormattedDate(form: "MM"))월 \(recordManger.getFormattedDate(form: "dd"))일")
                    .padding(.top, 10)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
                VStack{
                    TabView(selection: $currentIndex) {
                        ForEach(pages.indices, id: \.self) { i in
                            VStack {
                                if let note = harubitNote.first(where: {
                                    let noteYear = Calendar.current.component(.year, from: $0.createdDate)
                                    let isSameYear = noteYear == Int(pages[i])
                                    
                                    let isSameMonthAndDay = Calendar.current.component(.month, from: $0.createdDate) == Calendar.current.component(.month, from: selectedDate) &&
                                                            Calendar.current.component(.day, from: $0.createdDate) == Calendar.current.component(.day, from: selectedDate)
                                    
                                    return isSameYear && isSameMonthAndDay
                                }) {
                                    Text(note.content)
                                        .frame(width: 250, height: 400)
                                        .background(Color.blue.opacity(0.2), in : RoundedRectangle(cornerRadius: 50))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                } else {
                                    Text(localQuotes.randomElement() ?? "")
                                        .frame(width: 250, height: 400)
                                        .background(Color.purple.opacity(0.2), in : RoundedRectangle(cornerRadius: 50))
                                        .foregroundColor(.white)
                                        .italic()
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
//                                if let note = harubitNote.first(where: {Calendar.current.component(.year, from: $0.createdDate) == Int(pages[i]) && Calendar.current.isDate($0.createdDate, inSameDayAs: selectedDate)}) {
//                                    Text(note.content)
//                                        .frame(width: 250, height: 400)
//                                        .background(Color.blue.opacity(0.2), in : RoundedRectangle(cornerRadius: 50))
//                                        .foregroundColor(.white)
//                                        .cornerRadius(8)
//                                }
                            }
                            .tag(i)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 500)
//                    .background(Color.white.opacity(0.3))
                    .environment(\.layoutDirection, .leftToRight)
                    
                    HStack{
                        ForEach(pages.indices, id: \.self) {i in
                            ZStack{
                                Rectangle()
                                    .fill(currentIndex == i ? Color.accentColor :  Color.white.opacity(0.3))
                                    .frame(width: 80, height: 30)
                                    .cornerRadius(10)
                                    .animation(.easeInOut, value: currentIndex)
                                Text(pages[i])
                            }
                        }
                    }
                }
//                        .fill(Color).gray)
                Spacer()
            }
        }
    }
}

#Preview {
    RecordView(selectedDate: Date())
}
