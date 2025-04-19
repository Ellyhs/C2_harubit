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
    var createDate: Date
    
    init(content: String, createDate: Date) {
        self.content = content
        self.createDate = createDate
    }
    
    
}
