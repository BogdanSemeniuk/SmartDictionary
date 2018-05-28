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
    func makeTrainingSettingsModule() -> UIViewController
}

extension DependencyContainer: MenuModulFactory {
    func makeMenuModule(router: Router) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let presenter = MenuPresenter(view: vc, router: router, menuService: wordService)
        vc.presenter = presenter
        return vc
    }
}

extension DependencyContainer: SearchModulFactory {
    func makeSearchModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
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
    func makeTrainingSettingsModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TrainingSettingsViewController") as! TrainingSettingsViewController
        let presenter = TrainingSettingsPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}

