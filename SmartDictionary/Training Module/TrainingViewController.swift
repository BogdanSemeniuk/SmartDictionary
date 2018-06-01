//
//  TrainingViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 30.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol TrainingView: class {
    func set(cardTitle: String)
}

class TrainingViewController: UIViewController, TrainingView {
    
    var presenter: TrainingViewPresenter!
    
    @IBOutlet weak var cardLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardLabel.layer.backgroundColor = UIColor.white.cgColor
        cardLabel.layer.borderWidth = 5.0
        cardLabel.layer.borderColor = UIColor(red: 0.0, green: 144/255, blue: 81/255, alpha: 1.0).cgColor
        
        presenter.trainingViewDidLoad()
    }
    
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        presenter.cardWasTapped()
    }
    
    @IBAction func dragTheCard(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            let translation = sender.translation(in: view)
            
            let newX = cardLabel.center.x + translation.x
            cardLabel.center.x = newX
            sender.setTranslation(CGPoint.zero, in: view)
        } else if sender.state == .ended {
            if cardLabel.center.x < 30 {
                UIView.animate(withDuration: 0.1) { [weak self] in
                    self?.cardLabel.center.x = -200
                }
            } else if cardLabel.center.x > view.frame.size.width - 30 {
                UIView.animate(withDuration: 0.1) { [weak self] in
                    self?.cardLabel.center.x = self!.view.frame.size.width + 200
                }
            }
            UIView.animate(withDuration: 0, delay: 0.5, options: [], animations: { [weak self] in
                self?.cardLabel.transform = .identity
                self?.cardLabel.center = self!.view.center
            })
        }
    }
    
    
    func set(cardTitle: String) {
        self.cardLabel.text = cardTitle
    }
}
