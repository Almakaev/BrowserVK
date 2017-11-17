//
//  UserSearchAIUserSearchViewController.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 16/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController, UserSearchViewInput {

    var output: UserSearchViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: UserSearchViewInput
    func setupInitialState() {
    }
}
