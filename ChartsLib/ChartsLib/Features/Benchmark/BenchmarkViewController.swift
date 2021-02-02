//
//  BenchmarkViewController.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 30/01/21.
//

import UIKit

public protocol BenchmarkViewControllerDelegate: AnyObject {
    func benchmarkViewController(_ controller: BenchmarkViewController, didSucceed success: String)
    func benchmarkViewController(_ controller: BenchmarkViewController, didFail error: Error)
}

public final class BenchmarkViewController: UIViewController {

    @IBOutlet var benchmarkTableView: UITableView!

    public weak var delegate: BenchmarkViewControllerDelegate?

    var tableViewDataSource = BenchmarkTableViewDataSource()

    public init() {
        guard let bundle = BenchmarkViewController.containingBundle() else {
            fatalError("Could not locate bundle")
        }

        super.init(nibName: String(describing: BenchmarkViewController.self), bundle: bundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let bundle = BenchmarkViewController.containingBundle() else {
            fatalError("Could not locate bundle")
        }
        let nib = UINib(nibName: String(describing: BenchmarkTableViewCell.self), bundle: bundle)
        benchmarkTableView.register(nib, forCellReuseIdentifier: "BenchmarkTableViewCell")

        setDelegates()
    }

    func setDelegates() {
        self.benchmarkTableView.dataSource =  self.tableViewDataSource
    }

    public func addTo(parent: UIViewController, container cView: UIView? = nil, edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let ownerView = cView ?? parent.view else {
            return
        }
        
        ownerView.addSubview(self.view)
        parent.addChild(self)
        self.didMove(toParent: self)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.leadingAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.left).isActive = true
        self.view.topAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top).isActive = true
        self.view.trailingAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.trailingAnchor, constant: edgeInsets.right).isActive = true
        self.view.bottomAnchor.constraint(equalTo: ownerView.safeAreaLayoutGuide.bottomAnchor, constant: edgeInsets.bottom).isActive = true
    }

    public func refreshData() {
        self.benchmarkTableView?.reloadData()
    }
}

extension BenchmarkViewController: DataUpdating {
    func update(with state: DataRenderState) {
        switch state {
        case .toStart(let shouldStart):
            shouldStart ? print(""): print("")
        case .inProgress:
            // show spinner
            print("inProgress")
        case .failed(let error):
            delegate?.benchmarkViewController(self, didFail: error)
        case .success(let success):
            delegate?.benchmarkViewController(self, didSucceed: success)
        }
    }
}
