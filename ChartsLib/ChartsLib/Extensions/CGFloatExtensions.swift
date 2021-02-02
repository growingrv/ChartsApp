//
//  CGFloatExtensions.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 02/02/21.
//

import UIKit
import Foundation

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
