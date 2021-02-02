//
//  BenchmarkRange.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 30/01/21.
//

import Foundation

struct Benchmark: Decodable {
    let benchmarkRangePercent: Int
    let benchmarkRangeMin: Int
    let benchmarkRangeMax: Int
    let benchmarkLevel: Int
}
