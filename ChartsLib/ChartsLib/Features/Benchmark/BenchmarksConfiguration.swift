//
//  BenchmarksConfiguration.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 01/02/21.
//

import Foundation

public struct BenchmarksConfiguration {
    public var showChart: Bool = true
}

extension BenchmarksConfiguration {
    public static let `default` = BenchmarksConfiguration()
    
    public static func custom(showChart: Bool = true) -> BenchmarksConfiguration {
        return .init(showChart: showChart)
    }
}

