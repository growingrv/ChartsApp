//
//  LocalServiceAPI.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 30/01/21.
//

import UIKit

protocol LocalServiceAPIProtocol {
    func requestUserScoreInfo(from userScoreInfoData: Data, completion: @escaping (UserScoreInfo?) -> ())
    func requestBenchmarkList(from benchmarksData: Data, completion: @escaping ([Benchmark]) -> ())
}

class LocalServiceAPI: LocalServiceAPIProtocol {
    
    static let shared: LocalServiceAPIProtocol = LocalServiceAPI()
    private let operationQueue: OperationQueue = OperationQueue()

    private init() {}
    
    func requestUserScoreInfo(from userScoreInfoData: Data, completion: @escaping (UserScoreInfo?) -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.requestUserScoreInfoFromLocalFile(from: userScoreInfoData) { userScoreInfo in
                completion(userScoreInfo)
            }
        }
    }

    func requestBenchmarkList(from benchmarksData: Data, completion: @escaping ([Benchmark]) -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.requestBenchmarkInfoFromLocalFile(from: benchmarksData) { list in
                completion(list)
            }
        }
    }
}

extension LocalServiceAPI {
    
    private func requestUserScoreInfoFromLocalFile(from userScoreInfoData: Data, completion: @escaping (UserScoreInfo?) -> ()) {
        DispatchQueue.global(qos: .background).async {
            do {
                let values = try JSONDecoder().decode(UserScoreInfo.self, from: userScoreInfoData)
                DispatchQueue.main.async {
                    completion(values)
                }
                return
            } catch {
                print("Error deserializing JSON: \(error)")
            }
        }
    }

    private func requestBenchmarkInfoFromLocalFile(from benchmarksData: Data, completion: @escaping ([Benchmark]) -> ()) {
        DispatchQueue.global(qos: .background).async {
            do{
                let values = try JSONDecoder().decode([Benchmark].self, from: benchmarksData)
                DispatchQueue.main.async {
                     completion(values)
                }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
        }
    }
}

public enum Result<T> {
    case success
    case failure(Error)
}
