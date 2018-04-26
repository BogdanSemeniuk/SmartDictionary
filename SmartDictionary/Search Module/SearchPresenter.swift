//
//  SearchPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol SearchViewPresenter {
    func searchViewDidLoad()
    func searchButtonPressed(text: String)
}

class SearchPresenter: SearchViewPresenter {
    // MARK: - Properties
    
    private weak var view: SearchView?
    private var networkingManager: TranslateManager
    private var wordDetails: WordDetails?
    
    // MARK: - Initializer
    
    init(view: SearchView, networkingManager: TranslateManager) {
        self.view = view
        self.networkingManager = networkingManager
    }
    deinit { print("SearchPresenter deinit") }
    
    // MARK: - Action handling
    
    func searchButtonPressed(text: String) {
        networkingManager.translate(word: text) { [weak self] result in
            switch result{
            case .success(let wordDetails):
                self?.wordDetails = wordDetails
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    
    // MARK: - Error handling
    
    private func handleError(_ error: Error) {
        view?.showErrorMessage(message: error.localizedDescription)
    }
    
    // MARK: - View customization
    
    func searchViewDidLoad() {
        view?.setupView()
    }
}
