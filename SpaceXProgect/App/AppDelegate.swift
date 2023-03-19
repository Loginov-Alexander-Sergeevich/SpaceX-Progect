//
//  AppDelegate.swift
//  SpaceXProgect
//
//  Created by Александр Александров on 19.03.2023.
//

import UIKit
import SpaceXInformation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: CoordinatorSpaceXProtocol?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController()
        coordinator = CoordinatorSpaceX(navigationController: navigationController)
        coordinator?.start()
       
        
        self.window?.rootViewController = navigationController
        return true
    }


}

