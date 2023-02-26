//
//  AppDelegate.swift
//  Doggo
//
//  Created by Luiz Henrique on 24/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let factory = HomeFactory()
        let navigationController = UINavigationController.init(rootViewController: factory.newInstance())
        Reachability.shared.startNetworkReachabilityObserver()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
}

