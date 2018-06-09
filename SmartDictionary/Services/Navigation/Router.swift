//
//  Router.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}

class Router: Navigator {

    private weak var navigationController: UINavigationController?
    private let dependencyContainer: DependencyContainer

    // MARK: - Initializer

    init(navigationController: UINavigationController?, dependencyContainer: DependencyContainer) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
    }

    // MARK: - Navigation

    func navigate(to destination: Router.Destination) {
        let vc = makeModul(for: destination)
        switch destination {
        case .result:
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            navigationController?.present(vc, animated: true, completion: nil)
        default:
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    private func makeModul(for destination: Destination) -> UIViewController {
        switch destination {
        case .menu: return dependencyContainer.makeMenuModule(router: self)
        case .search: return dependencyContainer.makeSearchModule()
        case .dictionary: return dependencyContainer.makeDictionaryModule()
        case .trainingSettings: return dependencyContainer.makeTrainingSettingsModule(router: self)
        case .training(let settings): return dependencyContainer.makeTrainingModule(with: settings, router: self)
        case .result(let result): return dependencyContainer.makeResultModule(with: result, router: self)
        }
    }
}

// MARK: - Destination

extension Router {
    enum Destination {
        case menu
        case search
        case dictionary
        case trainingSettings
        case training(TrainingSettings)
        case result(Double)
    }
}