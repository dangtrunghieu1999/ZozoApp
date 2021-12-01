//
//  AppDelegate.swift
//  BamBo_App
//
//  Created by DangTrungHieu on 2/8/20.
//  Copyright © 2020 DangTrungHieu. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Alamofire
import SnapKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let feedVC =  FeedViewController()
        window?.rootViewController = UINavigationController(rootViewController: feedVC)
        return true
    }
    
}

