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
    
    // MARK: - Initializer
    
    init(view: MenuView?, router: Router) {
        self.view = view
        self.router = router
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
        
    }
    
    func trainingButtonWasTapped() {
        
    }
}
