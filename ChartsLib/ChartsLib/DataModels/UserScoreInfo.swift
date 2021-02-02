//
//  UserScoreInfo.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 31/01/21.
//

import Foundation

struct UserScoreInfo: Decodable {
    let userScoreValue: Int
    let userScoreMin: Int
    let userScoreMax: Int
}
