//
//  BenchmarkViewModel.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 30/01/21.
//

import UIKit

class BenchmarkViewModel {

    var dataSource = BenchmarkTableViewDataSource()
    var apiService : LocalServiceAPIProtocol
    let benchmarksData: Data
    var benchmarks = [Benchmark]()

    init(benchmarksData: Data, dataSource: BenchmarkTableViewDataSource) {
        self.dataSource = dataSource
        self.apiService = LocalServiceAPI.shared
        self.benchmarksData = benchmarksData
    }

    func getBenchmarkList(completion : @escaping (Result<Void>) -> Void){
        if (benchmarks.count > 0){
            dataSource.benchmarks = benchmarks
            return
        }
        
        apiService.requestBenchmarkList(from: self.benchmarksData, completion: { [weak self] benchmarks in
            self?.benchmarks = benchmarks ?? []
            self?.dataSource.benchmarks = self?.benchmarks ?? []
            completion(.success)
        })
    }
}
