//
//  AIUserSearchAIUserSearchInitializer.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 16/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit

class UserSearchModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var usersearchViewController: UserSearchViewController!

    override func awakeFromNib() {

        let configurator = UserSearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: usersearchViewController)
    }

}
