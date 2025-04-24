//
//  HomeView.swift
//  HarubitV3
//
//  Created by ellllly on 4/22/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var currentIndex = 2
    @Query private var model: [GratitudeCard]
    
    @State private var content: String = ""
    @State private var date: Date = Date.now
    
    var selectedDate: Date
    
    var today: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        return formatter.string(from: Date())
    }
    
    let localQuotes = [
        "감사는 마음에서 나오는 기쁨이다. \n– 윌리엄 아서 워드",
        "감사는 우리가 받은 모든 것에 대해 깊이 감사하는 마음이다. \n– 존 F. 케네디",
        "감사는 나의 삶을 채우는 기쁨이다. 감사함으로 모든 것을 바라보면 세상은 아름다워진다. \n– 마야 안젤루",
        "감사는 행복의 열쇠이다. 감사하지 않으면 아무리 많은 것을 가져도 행복할 수 없다. \n– 윌리엄 블레이크",
        "우리가 감사할 때, 우리는 주위의 모든 좋은 것들을 끌어당긴다. \n– 루이자 메이 올콧",
        "감사하는 마음은 가장 큰 행복을 가져온다. \n– 헬렌 켈러",
        "감사는 사람을 더욱 강하게 만든다. 우리가 가진 것에 감사함으로써, 우리는 더 많은 것을 얻을 수 있다. \n– 조지 워싱턴",
        "우리가 가진 것을 감사할 줄 아는 것이 진정한 부유함이다. \n– 미하일 바흐친",
        "감사는 단순히 마음에서 나오는 것이 아니라, 행동으로 이어져야 한다. \n– 윌리엄 아더 워드",
        "하루 하루를 감사함으로 살아간다면, 내일은 더욱 빛날 것이다. \n– 존 우든"
    ]
    
    
    var years: [Int] {
        let currentYear = Calendar.current.component(.year, from: selectedDate)
            
            return [currentYear - 2, currentYear - 1, currentYear, currentYear + 1]
        }
    
    func displayDate(for year: Int) -> String {
        var comps = Calendar.current.dateComponents([.month, .day], from: selectedDate)
        comps.year = year
        
        guard let date = Calendar.current.date(from: comps) else {return "" }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        
        return formatter.string(from: date)
        
    }
    
    private var cardWidth: CGFloat {
            UIScreen.main.bounds.width - 80   // 👈 40+40 여백
        }
    
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .scaledToFill() // 이미지 스케일 꽉차게 해줌
                .ignoresSafeArea()
           
            VStack {
                Text("Harubit")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding([.top, .bottom], 50)
            
                TabView(selection: $currentIndex) {
                    ForEach(years.indices, id: \.self) { i in
                        let year = years[i]
                        let showDate = displayDate(for: year)
                        
                        ZStack {
                            GratitudeCardView()
                                .frame(width: cardWidth, height: 400)
                            ScrollView {
                                VStack {
                                    
                                    Text(showDate)
                                        .foregroundColor(.brown)
                                        .font(.title2)
                                        .padding(.top, 40)
                                    Spacer()
                                    if let model = model.first(where: { item in
                                        Calendar.current.isDate(item.date, inSameDayAs: selectedDate)
                                        
                                    }) {
                                        
                                        Text(model.content)
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: 28, weight: .regular, design: .default))
                                            .foregroundColor(Color(red: 0.45, green: 0.42, blue: 0.28))
                                            .padding(.bottom, 30)
                                    } else {
                                        Text(localQuotes.randomElement() ?? "")
                                            .italic()
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 30)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    }
                                    Spacer()
                                }
                                .frame(width: 230, height: 340, alignment: .top)
                            }
                        }
                        .scaleEffect(i == currentIndex ? 1.0 : 0.9)
                        .rotation3DEffect(.degrees(i == currentIndex ? 0 : 20),
                                              axis: (x: 0, y: -1, z: 0),
                                          anchor: .center)
                        .opacity(i == currentIndex ? 1.0 : 0.6)
                        .padding(.horizontal, 32)
                        .tag(i)
                        .animation(.easeInOut, value: currentIndex)
//                        Text("Page \(i + 1)")
//                            .frame(maxWidth: 280, maxHeight: 400)
//                            .background(Color.blue.opacity(0.2), in : RoundedRectangle(cornerRadius: 50))
//                            .tag(i)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // 인디케이터 숨기기
                .frame(width:350, height: 460)
                .padding(.horizontal, 40)

                // 👉 커스텀 인디케이터
                HStack(spacing: 8) {
                    ForEach(0..<3) { i in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(i == currentIndex ? .brown : .gray)
                            .frame(width: i == currentIndex ? 20 : 8, height: 8)
                            .animation(.easeInOut, value: currentIndex)
                    }
                }
                .padding(.top, 10)
                
//                Button("Weekly Gratitude") {
//
//                }
            }
        }
    }
}

#Preview {
    HomeView(selectedDate: Date())
}
