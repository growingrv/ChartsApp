//
//  AppDelegate.swift
//  ChartsApp
//
//  Created by Gaurav Tiwari on 30/01/21.
//  Copyright © 2021 Gaurav Tiwari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let homeCoordinator = HomeCoordinator()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = homeCoordinator.homeView()
        self.window?.makeKeyAndVisible()

        homeCoordinator.startRenderingData()

        return true
    }
}

