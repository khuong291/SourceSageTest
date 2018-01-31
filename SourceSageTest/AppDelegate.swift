//
//  AppDelegate.swift
//  SourceSageTest
//
//  Created by KhuongPham on 1/29/18.
//  Copyright © 2018 KhuongPham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let controller = ContentTableViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = UIColor.white
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
        
        return true
    }

}

