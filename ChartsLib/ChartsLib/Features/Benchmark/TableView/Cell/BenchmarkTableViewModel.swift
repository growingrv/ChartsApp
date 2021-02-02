//
//  BenchmarkTableViewModel.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 01/02/21.
//

import UIKit

class BenchmarkTableViewModel {
    
    func shouldShowUserScoreValue(for min: Int, max: Int) -> Bool {

        guard let userScore = AppCache.shared.get(property: .userScoreValue), min <= Int(userScore), Int(userScore) <= max else {
            return false
        }
        return true
    }

    var userScoreValue: String {
        guard let userScoreValue = AppCache.shared.get(property: .userScoreValue) else {
            return ""
        }
        return "\(userScoreValue)"
    }
    
    func benchmarkCellBGColor(for level: Int) -> UIColor {
        switch level {
        case 1:
            return .benchmarkBGLevel1
        case 2:
            return .benchmarkBGLevel2
        case 3:
            return .benchmarkBGLevel3
        case 4:
            return .benchmarkBGLevel4
        case 5:
            return .benchmarkBGLevel5
        default:
            return .white
        }
    }
}
