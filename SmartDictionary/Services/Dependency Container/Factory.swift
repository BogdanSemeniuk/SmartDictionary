//
//  Factory.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol MenuModulFactory {
    func makeMenuModule(router: Router) -> UIViewController
}

protocol SearchModulFactory {
    func makeSearchModule() -> UIViewController
}

protocol DictionaryModulFactory {
    func makeDictionaryModule() -> UIViewController
}

protocol TrainingSettingsModulFactory {
    func makeTrainingSettingsModule(router: Router) -> UIViewController
}

protocol TrainingModulFactory {
    func makeTrainingModule(with settings: TrainingSettings) -> UIViewController
}

extension DependencyContainer: MenuModulFactory {
    func makeMenuModule(router: Router) -> UIViewController {
        let vc = MenuViewController.loadFromStoryboard()
        let presenter = MenuPresenter(view: vc, router: router, menuService: wordService)
        vc.presenter = presenter
        return vc
    }
}

extension DependencyContainer: SearchModulFactory {
    func makeSearchModule() -> UIViewController {
        let vc = SearchViewController.loadFromStoryboard()
        let presenter = SearchPresenter(view: vc, wordService: wordService)
        vc.presenter = presenter
        return vc
    }
}

extension DependencyContainer: DictionaryModulFactory {
    func makeDictionaryModule() -> UIViewController {
        let vc = self.dictionaryViewController
        if vc.presenter == nil {
            let presenter = DictionaryPresenter(view: vc, wordService: wordService)
            vc.presenter = presenter
        }
        return vc
    }
}

extension DependencyContainer: TrainingSettingsModulFactory {
    func makeTrainingSettingsModule(router: Router) -> UIViewController {
        let vc = TrainingSettingsViewController.loadFromStoryboard()
        let presenter = TrainingSettingsPresenter(view: vc, wordService: wordService, router: router)
        vc.presenter = presenter
        return vc
    }
}

extension DependencyContainer: TrainingModulFactory {
    func makeTrainingModule(with settings: TrainingSettings) -> UIViewController {
        let vc = TrainingViewController.loadFromStoryboard()
        let training = TrainingImplementation(trainingSettings: settings, storage: wordService)
        let presenter = TrainingPresenter(view: vc, training: training)
        vc.presenter = presenter
        return vc
    }
}
