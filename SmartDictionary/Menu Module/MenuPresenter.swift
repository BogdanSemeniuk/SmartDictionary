//
//  MenuPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol MenuViewPresenter {
    func viewWasLoaded()
    func searchButtonWasTapped()
    func dictionaryButtonWasTapped()
    func trainingButtonWasTapped()
}

class MenuPresenter: MenuViewPresenter {
    
    // MARK: - Properties
    
    private weak var view: MenuView?
    private var router: Router
    private var menuService: MenuStorage
    
    // MARK: - Initializer
    
    init(view: MenuView?, router: Router, menuService: MenuStorage) {
        self.view = view
        self.router = router
        self.menuService = menuService
    }
    
    deinit { print("MenuPresenter deinit") }
    
    // MARK: - Setup view
    
    func viewWasLoaded() {
        view?.setupView()
    }
    
    // MARK: - Handling actions
    
    func searchButtonWasTapped() {
        router.navigate(to: .search)
    }
    
    func dictionaryButtonWasTapped() {
        router.navigate(to: .dictionary)
    }
    
    func trainingButtonWasTapped() {
        if menuService.wordCards.isEmpty {
            view?.showMessage()
        } else {
            router.navigate(to: .trainingSettings)
        }
    }
}
