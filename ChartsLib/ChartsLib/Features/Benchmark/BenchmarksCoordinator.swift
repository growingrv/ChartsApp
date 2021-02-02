//
//  BenchmarksPresenter.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 30/01/21.
//

import Foundation

public final class BenchmarksCoordinator {
    
    var benchmarksDataView: DataUpdating?
    
    private let benchmarksData : Data
    private let configuration: BenchmarksConfiguration

    let tableViewDataSource = BenchmarkTableViewDataSource()
    var view = BenchmarkViewController()

    lazy var benchmarkViewModel : BenchmarkViewModel = {
        let viewModel = BenchmarkViewModel(benchmarksData: self.benchmarksData, dataSource: tableViewDataSource)
        return viewModel
    }()

    public init(benchmarksData: Data, configuration: BenchmarksConfiguration) {
        self.benchmarksData = benchmarksData
        self.configuration = configuration
    }

    public func initializeView() -> BenchmarkViewController {
        view = BenchmarkViewController()
        self.benchmarksDataView = view
        view.tableViewDataSource = tableViewDataSource
        return view
    }

    public func getBenchmarkList() {
        benchmarkViewModel.getBenchmarkList(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.didSucceed()
                case .failure(let error):
                    self.didFail(error: error)
                }
            }
        })
    }
    
    private func didFail(error: Error) {
        benchmarksDataView?.updateOnMain(with: .failed(error))
    }
    
    private func didSucceed() {
        benchmarksDataView?.updateOnMain(with: .success("Success"))
    }
}
