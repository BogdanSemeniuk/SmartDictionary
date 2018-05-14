//
//  DictionaryPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 08.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

protocol DictionaryViewPresenter {
    var numberOfItems: Int { get }
    func dictionaryViewDidLoad()
    func configure(cell: DictionaryCellView, forRow row: Int)
    func selected(cell: DictionaryCellView, forRow row: Int)
    func cellDeleted(forRow row: Int)
}

class DictionaryPresenter: DictionaryViewPresenter {
    
    private weak var view: DictionaryView?
    private var storage: Realm
    var numberOfItems: Int {
        return wordCards.count
    }
    private var wordCards: Results<WordCard>
    private var notificationToken: NotificationToken? = nil
    
    init(view: DictionaryView?, storage: Realm) {
        self.view = view
        self.storage = storage
        self.wordCards = storage.objects(WordCard.self)
    }
    deinit {
        print("DictionaryPresenter deinit")
        notificationToken?.invalidate()
    }
    
    func dictionaryViewDidLoad() {
        notificationsHandling(results: wordCards)
        
        view?.setUpTableView(with: DictionaryCell.giveSelfNib())
    }
    
    func configure(cell: DictionaryCellView, forRow row: Int) {
        let num = String(row + 1)
        let word = wordCards[row].isFlipped ? wordCards[row].translation : wordCards[row].value
        let flag = wordCards[row].isFlipped ? "🇷🇺" : "🇬🇧"
        cell.display(number: num, word: word, flag: flag)
    }
    
    func selected(cell: DictionaryCellView, forRow row: Int) {
        let wordCard = wordCards[row]
        try! storage.write {
            wordCard.isFlipped = !wordCard.isFlipped
        }
    }
    
    func cellDeleted(forRow row: Int) {
        let wordCard = wordCards[row]
        try! storage.write {
            storage.delete(wordCard)
        }
    }
    
    private func changeWordWithAnimation(in cell: DictionaryCellView, forRow row: Int) {
        let word = wordCards[row].isFlipped ? wordCards[row].translation : wordCards[row].value
        let flag = wordCards[row].isFlipped ? "🇷🇺" : "🇬🇧"
        cell.changeWordWithAnimation(to: word, flag: flag)
    }
    
    private func notificationsHandling(results: Results<WordCard>)  {
        notificationToken = results.observe({ [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .update(_, let deletions, let insertions, let modifications):
                if !deletions.isEmpty {
                    self?.view?.deleteCell(at: deletions.first!)
                } else if !insertions.isEmpty {
                    self?.view?.insertCell(at: insertions.first!)
                } else if !modifications.isEmpty {
                    guard let cell = self?.view?.giveCell(at: modifications.first!) else { return }
                    self?.changeWordWithAnimation(in: cell, forRow: modifications.first!)
                }
            case .error(let error):
                fatalError("\(error)")
            default: break
            }
        })
    }
}
