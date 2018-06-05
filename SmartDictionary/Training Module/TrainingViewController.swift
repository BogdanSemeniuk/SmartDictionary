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

class TrainingViewController: UIViewController, TrainingView, StoryboardIdentifiable {

    var presenter: TrainingViewPresenter!

    @IBOutlet weak var cardLabel: UILabel! {
        didSet {
            cardLabel.layer.backgroundColor = UIColor.white.cgColor
            cardLabel.layer.borderWidth = 5.0
            cardLabel.layer.borderColor = UIColor(red: 0.0, green: 144/255, blue: 81/255, alpha: 1.0).cgColor
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
            if cardLabel.frame.origin.x <= view.frame.origin.x {

                presenter.cardWasDragged(isFamiliarWord: false)

                UIView.animate(withDuration: 0.1) { [unowned self] in
                    self.cardLabel.frame.origin.x = self.view.frame.origin.x - self.cardLabel.frame.size.width
                }
            } else if cardLabel.frame.origin.x + cardLabel.frame.size.width >= view.frame.size.width {

                presenter.cardWasDragged(isFamiliarWord: true)

                UIView.animate(withDuration: 0.1) { [unowned self] in
                    self.cardLabel.frame.origin.x = self.view.frame.size.width + self.cardLabel.frame.size.width
                }
            }
            UIView.animate(withDuration: 0, delay: 0.5, options: [], animations: { [unowned self] in
                self.cardLabel.center = self.view.center
            })
        }
    }

    func set(cardTitle: String) {
        self.cardLabel.text = cardTitle
    }
}
