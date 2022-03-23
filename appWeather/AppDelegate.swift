//
//  AppDelegate.swift
//  appWeather
//
//  Created by Петр Постников on 17.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController = UINavigationController()
    var mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TitleNavigationController()
        CreateApp()
        return true
    }

    func CreateApp(){
        window = UIWindow(frame: UIScreen.main.bounds)
        self.navigationController = UINavigationController(rootViewController: self.mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func TitleNavigationController(){
        self.mainViewController.title = "СПИСОК ГОРОДОВ"
    }
}


