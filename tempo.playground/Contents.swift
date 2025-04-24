//import UIKit
import SwiftUI

var greeting = "Hello, playground"
let currentYear = Calendar.current.component(.year, from: Date.now)
var comps = Calendar.current.dateComponents([.month, .day], from: Date.now)
comps.month


var years: [Int] {
    var monthAndday = Calendar.current.dateComponents([.month, .day], from: Date.now)
    var currentYear = Calendar.current.component(.year, from: Date.now)
        
        return [currentYear - 2, currentYear - 1, currentYear]
    }


@MainActor func displayDate(for year: Int) -> Date {
    var comps = Calendar.current.dateComponents([.month, .day], from: Date.now)
    comps.year = year
    
    return Calendar.current.date(from: comps)!
}

print(years)

ForEach(years.indices, id: \.self) { i in
    let year = years[i]
    let showDate = displayDate(for: year)
    print(showDate)
}
