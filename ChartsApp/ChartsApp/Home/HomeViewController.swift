//
//  HomeViewController.swift
//  ChartsApp
//
//  Created by Gaurav Tiwari on 01/02/21.
//  Copyright © 2021 Gaurav Tiwari. All rights reserved.
//

import UIKit
import ChartsLib

class HomeViewController: BaseViewController {

    @IBOutlet private var userScoreView: UIView!
    @IBOutlet private var benchmarksView: UIView!

    var userScoreViewController: UserScoreViewController
    var benchmarkViewController: BenchmarkViewController
    
    lazy var homeViewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        return viewModel
    }()
    
    init(userScoreViewController: UserScoreViewController, benchmarkViewController: BenchmarkViewController) {
        self.userScoreViewController = userScoreViewController
        self.benchmarkViewController = benchmarkViewController
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addUserScoreView()
        addBenchmarksView()
    }
    
    func addUserScoreView() {
        self.userScoreViewController.delegate = self
        self.userScoreViewController.addTo(parent: self, container: userScoreView)
    }

    func addBenchmarksView() {
        self.benchmarkViewController.delegate = self
        self.benchmarkViewController.addTo(parent: self, container: benchmarksView)
    }
}

extension HomeViewController: UserScoreViewControllerDelegate {
    public func userScoreViewController(_ controller: UserScoreViewController, didSucceed success: String) {
        self.benchmarkViewController.refreshData()
    }
    
    public func userScoreViewController(_ controller: UserScoreViewController, didFail error: Error) {
        
    }
}

extension HomeViewController: BenchmarkViewControllerDelegate {
    public func benchmarkViewController(_ controller: BenchmarkViewController, didSucceed success: String) {
        
    }
    
    public func benchmarkViewController(_ controller: BenchmarkViewController, didFail error: Error) {
        
    }
}
