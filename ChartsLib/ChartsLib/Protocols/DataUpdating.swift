//
//  DataPresenter.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 01/02/21.
//

import Foundation

protocol DataUpdating: AnyObject {
    func update(with: DataRenderState)
}

extension DataUpdating {
    func updateOnMain(with state: DataRenderState) {
        Thread.executeOnMain {
            self.update(with: state)
        }
    }
}

enum DataRenderState {
    case toStart(shouldStart: Bool)
    case inProgress
    case failed(Error)
    case success(String)
}

