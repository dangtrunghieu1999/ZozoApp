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

import GooglePlaces
@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        GMSPlacesClient.provideAPIKey(APIConfig.GGPlaceAPIKey)
        
        
        let attributed = [NSAttributedString.Key.foregroundColor: UIColor.white,
                          NSAttributedString.Key.font: UIFont.systemFont(ofSize: FontSize.body.rawValue)]
        UINavigationBar.appearance().titleTextAttributes = attributed
        UINavigationBar.appearance().barTintColor = UIColor.background
        UINavigationBar.appearance().tintColor = UIColor.white
        
        UINavigationBar.appearance().barStyle = .black

        window = UIWindow(frame: UIScreen.main.bounds)

        let feedVC =  FeedViewController()
        window?.rootViewController = UINavigationController(rootViewController: feedVC)
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
}

