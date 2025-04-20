//
//  HarubitNote.swift
//  HarubitV2
//
//  Created by ellllly on 4/20/25.
//

import Foundation
import SwiftData

@Model
class HarubitNote {
    
    var content: String
    var createdDate: Date
    
    init(content: String, createdDate: Date = Date()) {
        self.content = content
        self.createdDate = createdDate
    }
    
}
