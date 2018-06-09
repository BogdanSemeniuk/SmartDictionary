//
//  ResultViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 07.06.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol ResultView: class {
}

class ResultViewController: UIViewController, ResultView, StoryboardIdentifiable {

    var presenter: ResultViewPresenter!

}
