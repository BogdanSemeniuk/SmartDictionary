//
//  MeaningTableViewCell.swift
//  SmartDictionary
//
//  Created by Bogdan on 27.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

class MeaningTableViewCell: UITableViewCell, MeaningCellView {
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    
    func display(meaning: String?) {
        guard let meaning = meaning else { meaningLabel.text = nil; return}
        meaningLabel.text = meaning
    }
    
    func display(translation: String?) {
        guard let translation = translation else { translationLabel.text = nil; return}
        translationLabel.text = translation
    }
}
