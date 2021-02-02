//
//  ThreadExtensions.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 01/02/21.
//

import Foundation

extension Thread {
    // Checks the current thread and runs the given closure synchronously on the main thread.
    static func executeOnMain(_ mainThreadClosure: () -> Void) {
        if self.current == self.main {
            mainThreadClosure()
        } else {
            let mainQueue = DispatchQueue.main
            mainQueue.sync(execute: {
                mainThreadClosure()
            })
        }
    }
}
