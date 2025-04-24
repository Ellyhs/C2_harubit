//
//  GratitudeCard.swift
//  HarubitV3
//
//  Created by ellllly on 4/23/25.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class GratitudeCard {
//class GratitudeCard: Identifiable {
//    var id = UUID()
    var date: Date
    var content: String
    
    init(date: Date = Date(), content: String){
        self.date = date
        self.content = content
    }
}
