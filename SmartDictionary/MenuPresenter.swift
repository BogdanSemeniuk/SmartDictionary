//
//  MenuPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

class MenuPresenter: MenuViewPresenter {
    
    // MARK: - Properties
    
    private weak var view: MenuView?
    
    // MARK: - Initializer
    
    init(view: MenuView) {
        self.view = view
    }
    
    deinit {
        print("MenuPresenter deinit")
    }
}

// MARK: - MenuViewPresenter protocol

protocol MenuViewPresenter {
    
}
