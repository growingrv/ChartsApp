//
//  UIViewControllerExtensions.swift
//  ChartsLib
//
//  Created by Gaurav Tiwari on 01/02/21.
//

import UIKit

extension UIViewController {
    
    static func containingBundle() -> Bundle? {
        let rootBundle = Bundle(for: self)
        let nibName = String(describing: self)
        
        if rootBundle.path(forResource: nibName, ofType: "nib") != nil {
            return rootBundle
        }
        
        guard let rootBundleURL = URL(string: rootBundle.bundlePath) else {
            return nil
        }
        
        let bundleName = rootBundleURL.lastPathComponent.replacingOccurrences(of: ".framework", with: "")
        
        guard let bundleURL = rootBundle.url(forResource: bundleName, withExtension: "bundle") else {
            return nil
        }
        
        return Bundle(url: bundleURL)
    }
}
