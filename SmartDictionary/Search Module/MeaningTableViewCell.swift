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
    
    func display(meaning: String?, translation: String?) {
        meaningLabel.isHidden = (meaning == nil)
        translationLabel.isHidden = (translation == nil)
        meaningLabel.text = meaning
        translationLabel.text = translation
    }
}
