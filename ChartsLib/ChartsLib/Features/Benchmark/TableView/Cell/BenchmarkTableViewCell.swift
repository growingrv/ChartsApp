//
//  BenchmarkTableViewCell.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 30/01/21.
//

import UIKit

class BenchmarkTableViewCell: UITableViewCell {
    
    @IBOutlet private var benchmarkRangePercentLabel: UILabel!
    @IBOutlet private var benchmarkRangeLabel: UILabel!
    @IBOutlet private var benchmarkRangeView: UIView!
    @IBOutlet private var benchmarkValueIndicatorView: UIView!
    @IBOutlet private var benchmarkValueIndicatorImage: UIImageView!
    @IBOutlet private var benchmarkValueIndicatorLabel: UILabel!
    
    func configure(with data: Benchmark) {
        benchmarkRangePercentLabel.text = "\(data.benchmarkRangePercent)%"
        benchmarkRangeLabel.text = "\(data.benchmarkRangeMin)-\(data.benchmarkRangeMax)"
        benchmarkValueIndicatorLabel.isHidden = true

        if BenchmarkTableViewModel().shouldShowUserScoreValue(for: data.benchmarkRangeMin, max: data.benchmarkRangeMax) {
            benchmarkValueIndicatorView.isHidden = false
            benchmarkValueIndicatorImage.isHidden = false
            benchmarkValueIndicatorLabel.isHidden = false
            benchmarkValueIndicatorLabel.text = BenchmarkTableViewModel().userScoreValue
        }
        
        self.benchmarkRangeView.backgroundColor = BenchmarkTableViewModel().benchmarkCellBGColor(for: data.benchmarkLevel)
    }
}
