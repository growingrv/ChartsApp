//
//  HomePresenter.swift
//  ChartsApp
//
//  Created by Gaurav Tiwari on 01/02/21.
//  Copyright © 2021 Gaurav Tiwari. All rights reserved.
//

import UIKit
import ChartsLib

class HomeCoordinator {
    var userScoreViewController: UserScoreViewController?
    var benchmarkViewController: BenchmarkViewController?
    
    var userScoreCoordinator: UserScoreCoordinator?
    var benchmarksCoordinator: BenchmarksCoordinator?
    
    init() {
        guard let userScoreInfoData = self.dataFromJSONFile("ScoreInfo") else {
            print("Error getting data from file")
            return
        }
        self.userScoreCoordinator = UserScoreCoordinator(userScoreInfoData: userScoreInfoData, configuration: .default)
        userScoreViewController = self.userScoreCoordinator?.initializeView()
        
        guard let benchmarksData = self.dataFromJSONFile("BenchmarksInfo") else {
            print("Error getting data from file")
            return
        }
//        benchmarkViewController = BenchmarkViewController(benchmarksData: benchmarksData)
        self.benchmarksCoordinator = BenchmarksCoordinator(benchmarksData: benchmarksData, configuration: .default)
        benchmarkViewController = self.benchmarksCoordinator?.initializeView()
    }
    
    func homeView() -> UIViewController? {
        guard let userScoreViewController = self.userScoreViewController, let benchmarkViewController = self.benchmarkViewController else {
            return nil
        }
        
        return HomeViewController(userScoreViewController: userScoreViewController, benchmarkViewController: benchmarkViewController)
    }
    
    func startRenderingData() {
        userScoreCoordinator?.getUserScoreInfo()
        benchmarksCoordinator?.getBenchmarkList()
    }
    
    func dataFromJSONFile(_ filename: String) -> Data? {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        return nil
    }
}
