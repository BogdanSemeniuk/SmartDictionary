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
    func configure(cell: MeaningCellView, forRow row: Int)
    var numberOfMeanings: Int { get }
}

class SearchPresenter: SearchViewPresenter {

    // MARK: - Properties
    
    private weak var view: SearchView?
    private var networkingManager: TranslateManager
    private var wordDetails: WordDetails?
    var numberOfMeanings: Int {
        return wordDetails?.tuc.count ?? 0
    }
    
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
                self?.view?.updateView()
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    
    // MARK: - Error handling
    
    private func handleError(_ error: ErrorDescription) {
        view?.showErrorMessage(message: error.description)
    }
    
    // MARK: - View customization
    
    func searchViewDidLoad() {
        view?.setupView()
    }
    
    func configure(cell: MeaningCellView, forRow row: Int) {
        guard let wordParts = wordDetails?.tuc else { return }
        let wordPart = wordParts[row]
        let meaning = wordPart.meanings?.first?.text.stripHTML()
        let translation = wordPart.phrase?.text.stripHTML()
        cell.display(meaning: meaning, translation: translation)
    }
}
