//
//  AppDelegate.swift
//  GridExample
//
//  Created by Majid Boudaoud on 18/04/2020.
//  Copyright © 2020 Majid Boudaoud. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    private func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = SpringBoardViewController()
        window.rootViewController = homeViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

