//
//  SearchPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

protocol SearchViewPresenter {
    func searchViewDidLoad()
    func searchButtonPressed(text: String)
    func configure(cell: MeaningCellView, forRow row: Int)
    var numberOfItems: Int { get }
    func addToDictionaryWasTapped()
}

class SearchPresenter: SearchViewPresenter {

    // MARK: - Properties
    
    private weak var view: SearchView?
    private var networkingManager: TranslateManager
    private var storage: Realm
    private var wordDetails: WordDetails?
    private var word: Word? {
        guard let value = wordDetails?.phrase, let translation = wordDetails?.tuc.first?.phrase?.text else { return nil }
        return Word(value: value, translation: translation)
    }
    var numberOfItems: Int {
        return wordDetails?.tuc.count ?? 0
    }
    
    // MARK: - Initializer
    
    init(view: SearchView?, networkingManager: TranslateManager, storage: Realm) {
        self.view = view
        self.networkingManager = networkingManager
        self.storage = storage
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
    
    func addToDictionaryWasTapped() {
        guard let word = word else { return }
        try! storage.write {
            storage.add(word, update: true)
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
        let meaning = wordPart.meanings?.first
        let translation = wordPart.phrase?.text.stripHTML()
        cell.display(meaning: meaning, translation: translation)
    }
}
