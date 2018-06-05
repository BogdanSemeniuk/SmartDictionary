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
    var numberOfItems: Int { get }
    func searchViewDidLoad()
    func searchButtonPressed(text: String)
    func configure(cell: MeaningCellView, forRow row: Int)
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
    }
    deinit { print("SearchPresenter deinit") }

    // MARK: - Action handling

    func searchButtonPressed(text: String) {
        wordService.translate(word: text, complitionHandler: { [weak self] result in
            switch result {
            case .success(let wordDetails):
                self?.wordDetails = wordDetails
                self?.view?.updateView()
            case .failure(let error):
                self?.handleError(error)
            }
        })
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
