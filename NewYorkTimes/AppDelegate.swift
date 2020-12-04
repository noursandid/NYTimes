//
//  AppDelegate.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let viewModel = MostPopularArticlesViewModel()
        let mostPopularArticlesViewController = MostPopularArticlesViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: mostPopularArticlesViewController)
        window?.rootViewController = navigationController
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}
