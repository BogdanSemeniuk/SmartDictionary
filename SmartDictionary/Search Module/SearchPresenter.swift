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
    private var wordService: WordSearch
    private var wordDetails: WordDetails?
    private var word: WordCard? {
        guard let value = wordDetails?.phrase, let translation = wordDetails?.tuc.first?.phrase?.text else { return nil }
        return WordCard(value: value, translation: translation)
    }
    var numberOfItems: Int {
        return wordDetails?.tuc.count ?? 0
    }
    
    // MARK: - Initializer
    
    init(view: SearchView?, wordService: WordSearch) {
        self.view = view
        self.wordService = wordService
        NotificationCenter.default.addObserver(self, selector: #selector(wordDetailsWasSended(_:)), name: NSNotification.Name("wordDetails"), object: nil)
    }
    deinit {
        print("SearchPresenter deinit")
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "wordDetails"), object: nil)
    }
    
    // MARK: - Action handling
    
    @objc func wordDetailsWasSended(_ notification: NSNotification) {
        guard let result = notification.object as? Result<WordDetails> else { return }
        switch result {
        case .success(let wordDetails):
            self.wordDetails = wordDetails
            view?.updateView()
        case .failure(let error):
            handleError(error)
        }
    }
    
    func searchButtonPressed(text: String) {
        wordService.translate(word: text)
    }
    
    func addToDictionaryWasTapped() {
        wordService.add(word: word)
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
