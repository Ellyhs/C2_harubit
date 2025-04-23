//
//  RecordManager.swift
//  HarubitV2
//
//  Created by ellllly on 4/20/25.
//

import Foundation
import SwiftUI

class RecordManager: ObservableObject {
    @Published var selectedDate: Date = Date()
    
    func getFormattedDate(form: String) -> String {
        let formatter = DateFormatter()
      
        formatter.dateFormat = form
        
        return formatter.string(from: selectedDate)
    }
}
