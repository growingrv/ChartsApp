//
//  BenchmarkTableViewDataSource.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 30/01/21.
//

import UIKit

class BenchmarkTableViewDataSource: NSObject, UITableViewDataSource {
    
    var benchmarks = [Benchmark]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return benchmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BenchmarkTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BenchmarkTableViewCell", for: indexPath) as! BenchmarkTableViewCell
        let benchmark: Benchmark = benchmarks[indexPath.row]
        cell.configure(with: benchmark)
        return cell
    }
}
