//
//  UserScoreViewController.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 31/01/21.
//

import UIKit

public protocol UserScoreViewControllerDelegate: AnyObject {
    func userScoreViewController(_ controller: UserScoreViewController, didSucceed success: String)
    func userScoreViewController(_ controller: UserScoreViewController, didFail error: Error)
}

public final class UserScoreViewController: UIViewController {

    @IBOutlet var userScoreValue: UILabel!
    @IBOutlet var userScoreCalculationDate: UILabel!

    public weak var delegate: UserScoreViewControllerDelegate?

    public init() {
        guard let bundle = UserScoreViewController.containingBundle() else {
            fatalError("Could not locate bundle")
        }
        super.init(nibName: String(describing: UserScoreViewController.self), bundle: bundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        addCircleWithAnimation()
    }
        
    private func addCircleWithAnimation() {
        let circleView = CircularView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width * 0.75, height: view.frame.size.height * 0.75))

        circleView.percent = Double(Utils.shared.chartIndicatorValue)
        circleView.lineWidth = 14.0
        circleView.lineColor = .circleColor
        circleView.backgroundLineWidth = 14.0
        circleView.backgroundLineColor = .circleBGColor
        circleView.animateCircle(duration: 3)
        circleView.backgroundColor = .clear
        self.view.addSubview(circleView)
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

}

extension UserScoreViewController: DataUpdating {
    func update(with state: DataRenderState) {
        switch state {
        case .toStart(let shouldStart):
            shouldStart ? print(""): print("")
        case .inProgress:
            // show spinner
            print("inProgress")
        case .failed(let error):
            delegate?.userScoreViewController(self, didFail: error)
        case .success(let success):            
            delegate?.userScoreViewController(self, didSucceed: success)
        }
    }
}
