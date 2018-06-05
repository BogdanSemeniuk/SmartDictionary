//
//  DependencyContainer.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

class DependencyContainer {
    lazy var apiClient = ApiClientImplementation()
    lazy var storage = try! Realm()
    lazy var dictionaryViewController: DictionaryTableViewController  = {
        let storyboard = UIStoryboard(storyboard: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "DictionaryTableViewController") as! DictionaryTableViewController
        return vc
    }()
    lazy var wordService = WordService(storage: storage, apiClient: apiClient)
}
