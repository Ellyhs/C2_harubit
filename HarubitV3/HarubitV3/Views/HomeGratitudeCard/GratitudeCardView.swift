import SwiftUI



// 카드 뷰
struct GratitudeCardView: View {
    @StateObject private var recordManager = RecordManager()
//    let card: GratitudeCard

    var body: some View {
        ZStack {
            
            ZStack{
                // 바깥 카드
                
                Image("background3") // Assets에 추가한 이미지 이름
                    .resizable()
                    .scaledToFill()
                    .frame(width: 260, height: 400)
//                    .frame(width: 300, height: 450)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(color: Color.white.opacity(0.2), radius: 10, x: -10, y: -10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.white, lineWidth: 0.8)
                    )
                
                
                // 안쪽 카드
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 10) {
                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                            .fill(.clear)
//                        ForEach(card.items, id: \.self) { item in
//                            HStack(alignment: .top, spacing: 8) {
//                                Text("•")
//                                Text(item)
//                                    .lineLimit(200)
//                            }
//                            .font(.system(size: 19, weight: .regular, design: .default))
//                            .foregroundColor(Color(red: 0.26, green: 0.25, blue: 0.20))
//                        }
                    }
//                    HStack(spacing: 16) {
//                        Spacer()
//                        Image(systemName: "pencil")
//                            .font(.system(size: 18))
//                            .foregroundColor(.gray.opacity(0.6))
//                        Image(systemName: "square.and.pencil")
//                            .font(.system(size: 18))
//                            .foregroundColor(.gray.opacity(0.6))
//                    }
                }
                .padding(22)
                .background(
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 1.0, green: 0.943, blue: 0.762, opacity: 1.00)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
//                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                        .stroke(Color.white, lineWidth: 1.0)
                )
                .padding(10)
                .frame(width: 260, height: 315)
            }
            .frame(width: 245, height: 315)
        }
        
    }
    
}


//#Preview {
//    GratitudeCardView(card: card)
//}
