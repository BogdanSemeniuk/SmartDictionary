//
//  DictionaryCell.swift
//  SmartDictionary
//
//  Created by Bogdan on 09.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol DictionaryCellView {
    func display(number: String, word: String, flag: String)
    func changeWordWithAnimation(to newWord: String, flag: String)
}

class DictionaryCell: UITableViewCell, DictionaryCellView {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!

    func display(number: String, word: String, flag: String) {
        numberLabel.text = number
        wordLabel.text = word
        flagLabel.text = flag
    }

    static func giveSelfNib() -> UINib {
        return UINib(nibName: "DictionaryCell", bundle: nil)
    }

    func changeWordWithAnimation(to newWord: String, flag: String) {
        wordLabel.animateAdding(0.8, newText: newWord)
        flagLabel.text = flag
    }
}
