//
//  UserScoreConfiguration.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 01/02/21.
//

import Foundation

public struct UserScoreConfiguration {
    public var showChart: Bool = true
}

extension UserScoreConfiguration {
    public static let `default` = UserScoreConfiguration()
    
    public static func custom(showChart: Bool = true) -> UserScoreConfiguration {
        return .init(showChart: showChart)
    }
}
