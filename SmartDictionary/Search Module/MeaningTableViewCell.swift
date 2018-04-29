//
//  MeaningTableViewCell.swift
//  SmartDictionary
//
//  Created by Bogdan on 27.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol MeaningCellView {
    func display(meaning: String?, translation: String?)
}

class MeaningTableViewCell: UITableViewCell, MeaningCellView {

    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    private let fontSize: CGFloat = 20.0
    
    func display(meaning: String?, translation: String?) {
        meaningLabel.isHidden = (meaning == nil)
        translationLabel.isHidden = (translation == nil)
        addAttributesToMeaning(meaning: meaning)
        addAttributesToTranslation(translation: translation)
    }
    
    private func addAttributesToMeaning(meaning: String?) {
        guard let meaning = meaning else { return }
        let attributesForMeaning = [NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: fontSize)!]
        let attrMeaningString = NSAttributedString(string: meaning, attributes: attributesForMeaning)
        
        let beginningOfString = "Meaning: "
        let attributesForBeginning = [NSAttributedStringKey.font: UIFont(name: "AvenirNext-Bold", size: fontSize)!]
        let attrString = NSMutableAttributedString(string: beginningOfString, attributes: attributesForBeginning)
        attrString.append(attrMeaningString)
        meaningLabel.attributedText = attrString
    }
    
    private func addAttributesToTranslation(translation: String?) {
        guard let translation = translation else { return }
        let attributesForTranslation = [NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: fontSize)!]
        let attrTranslationString = NSAttributedString(string: translation, attributes: attributesForTranslation)
        
        let beginningOfString = "Translation: "
        let attributesForBeginning = [NSAttributedStringKey.font: UIFont(name: "AvenirNext-BoldItalic", size: fontSize)!]
        let attrString = NSMutableAttributedString(string: beginningOfString, attributes: attributesForBeginning)
        attrString.append(attrTranslationString)
        translationLabel.attributedText = attrString
    }
}
