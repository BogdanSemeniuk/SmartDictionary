//
//  ResultPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 07.06.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol ResultViewPresenter {
}

class ResultPresenter: ResultViewPresenter {

    private weak var view: ResultView?
    private var result: Double
    private var router: Router

    init(view: ResultView, result: Double, router: Router) {
        self.view = view
        self.result = result
        self.router = router
    }

}
