//
//  Router.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

class Router: Navigator {
    
    private weak var navigationController: UINavigationController?
    private let dependencyContainer: DependencyContainer
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController, dependencyContainer: DependencyContainer) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }
    
    // MARK: - Navigation
    
    func navigate(to destination: Router.Destination) {
        
    }
    
    private func makeModul(for destination: Destination) -> UIViewController {
        switch destination {
        case .menu: dependencyContainer
        case .search: break
        }
        return UIViewController()
    }
}

// MARK: - Destination

extension Router {
    enum Destination {
        case menu
        case search
    }
}

