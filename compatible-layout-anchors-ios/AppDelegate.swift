//
//  AppDelegate.swift
//  compatible-layout-anchors-ios
//
//  Created by Lukas Würzburger on 12/5/17.
//  Copyright © 2017 Truffls GmbH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Variables

    var window: UIWindow?

    // MARK: - Application Delegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController]
        window!.rootViewController = tabBarController
        window!.makeKeyAndVisible()
        return true
    }
}

