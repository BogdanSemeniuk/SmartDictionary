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
    func showObjects()
}

class DictionaryPresenter: DictionaryViewPresenter {
    
    private weak var view: DictionaryView?
    private var storage: Realm
    
    init(view: DictionaryView?, storage: Realm) {
        self.view = view
        self.storage = storage
    }
    
    func showObjects() {
        print(storage.objects(Word.self))
    }
}
