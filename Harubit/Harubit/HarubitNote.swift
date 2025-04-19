//
//  HarubitNote.swift
//  Harubit
//
//  Created by ellllly on 4/19/25.
//

import Foundation
import SwiftData

@Model
class HarubitNote {
    var content: String
    var createdDate: Date
    
    init(content: String, createdDate: Date) {
        self.content = content
        self.createdDate = createdDate
    }
    
    
}
