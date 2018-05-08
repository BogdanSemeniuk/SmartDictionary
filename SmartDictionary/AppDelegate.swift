//
//  AppDelegate.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var router: Router = {
        let navController = UINavigationController()
        setup(navigationController: navController)
        let dependencyContainer = DependencyContainer()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = navController
        return Router(navigationController: navController, dependencyContainer: dependencyContainer)
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        router.navigate(to: .menu)
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        return true
    }
    
    private func setup(navigationController: UINavigationController) {
        let navigationBarAppearace = UINavigationBar.appearance()
        let greenColor = UIColor(red: 0, green: 144/255, blue: 81/255, alpha: 1)
        navigationBarAppearace.barTintColor = greenColor
        navigationBarAppearace.tintColor = UIColor.white
        let titleTextAttributed: [NSAttributedStringKey: Any] =
            [.foregroundColor: UIColor.white,
            .font: UIFont(name: "AmericanTypewriter-Bold", size: 18) as Any]
        navigationController.navigationBar.titleTextAttributes = titleTextAttributed
        
    }
}

