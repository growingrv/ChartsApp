//
//  Utils.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 02/02/21.
//

import Foundation

struct Utils {
    
    static let shared = Utils()
    
    private init () {}
    
    // This is not accurate. To get accurate values, following logic should be made accurate according to 300-900 credit score formula.
    var chartIndicatorValue: Double {
        let max = Double(900)

        let actual = Double(AppCache.shared.get(property: .userScoreValue) ?? 0)
        
        let percent1 = Double(actual/max)
        let percent = Double(percent1 * 100)
        
        return percent
    }
    
    var todaysDate: String {
        return Date.currentDate()
    }
}
