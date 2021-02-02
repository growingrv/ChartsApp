//
//  NSDateExtensions.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 02/02/21.
//

import Foundation

extension Date {

 static func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: Date())
    }
}
