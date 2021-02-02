//
//  HomeViewModel.swift
//  ChartsApp
//
//  Created by Gaurav Tiwari on 01/02/21.
//  Copyright © 2021 Gaurav Tiwari. All rights reserved.
//

import Foundation

class HomeViewModel {
    
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
