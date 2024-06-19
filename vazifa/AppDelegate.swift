//
//  AppDelegate.swift
//  vazifa
//
//  Created by Macbook on 16/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let vc = MainVC.init(nibName: "MainVC", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        return true
    }



}

