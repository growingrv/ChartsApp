//
//  UserScorePresenter.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 01/02/21.
//

import Foundation

public final class UserScoreCoordinator {
    
    var userScoreInfoView: DataUpdating?
    
    private let userScoreInfoData : Data
    private let configuration: UserScoreConfiguration

    lazy var userScoreViewModel: UserScoreViewModel = {
        let viewModel = UserScoreViewModel(userScoreInfoData: self.userScoreInfoData)
        return viewModel
    }()

    public init(userScoreInfoData: Data, configuration: UserScoreConfiguration) {
        self.userScoreInfoData = userScoreInfoData
        self.configuration = configuration
    }

    public func initializeView() -> UserScoreViewController {
        let view = UserScoreViewController()
        self.userScoreInfoView = view
        return view
    }
    
    public func getUserScoreInfo() {
        userScoreViewModel.getUserScoreInfo(completion: { result in
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
        userScoreInfoView?.updateOnMain(with: .failed(error))
    }
    
    private func didSucceed() {
        let view = userScoreInfoView as? UserScoreViewController
        
        if let value = self.userScoreViewModel.userScoreInfo?.userScoreValue {
            view?.userScoreValue.text = "\(value)"
            view?.userScoreCalculationDate.text = "As of \(Utils.shared.todaysDate)"
        }
        userScoreInfoView?.updateOnMain(with: .success("Success"))
    }
}
