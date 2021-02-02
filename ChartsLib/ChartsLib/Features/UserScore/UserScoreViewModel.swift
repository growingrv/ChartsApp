//
//  BenchmarkViewModel.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 31/01/21.
//

import Foundation

class UserScoreViewModel {
    
    var userScoreInfo: UserScoreInfo?
    var apiService : LocalServiceAPIProtocol
    let userScoreInfoData: Data

    init(userScoreInfoData: Data) {
        apiService = LocalServiceAPI.shared
        self.userScoreInfoData = userScoreInfoData
    }
    
    func getUserScoreInfo(completion : @escaping (Result<Void>) -> Void) {
        guard userScoreInfo == nil else {
            return
        }
        
        apiService.requestUserScoreInfo(from: self.userScoreInfoData, completion: { [weak self] userScoreInfo in
            self?.userScoreInfo = userScoreInfo
            guard let userScoreValue = userScoreInfo?.userScoreValue else {
                return
            }
            self?.persist(userScoreValue: userScoreValue)
            completion(.success)
        })
    }
    
    func persist(userScoreValue: Int) {
        AppCache.shared.update(property: .userScoreValue, value: userScoreValue)
    }

}

