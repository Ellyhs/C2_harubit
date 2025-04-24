//
//  RecordManager.swift
//  HarubitV3
//
//  Created by ellllly on 4/23/25.
//

import Foundation
import SwiftUI


class RecordManager: ObservableObject {
    @Published var CreatedDate: Date = Date()
    @Published var createdContent: String = ""
    
    
    // 오늘 날짜 추출
    func getFormattedDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: CreatedDate)
    }
    
    // 작성한 일기
//    func createdContent() -> String {
//        let content =
//    }
}
