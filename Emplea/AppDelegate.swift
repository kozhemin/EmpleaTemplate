//
//  AppDelegate.swift
//  Emplea
//
//  Created by Егор Кожемин on 06.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let rootVC = RootViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()

        return true
    }
}
