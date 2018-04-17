//
//  SearchPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

class SearchPresenter: SearchViewPresenter {
    private weak var view: SearchView?
    
    // MARK: - Initializer
    
    init(view: SearchView) {
        self.view = view
    }
    deinit { print("SearchPresenter deinit") }
}

// MARK: - SearchViewPresenter protocol

protocol SearchViewPresenter {
}
