//
//  UserSearchUserSearchRouter.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit

class UserSearchRouter: UserSearchRouterInput {
    
    func openUserSearchViewController(in window: UIWindow) {
        let userSearchViewController = UserSearchViewController()
        window.backgroundColor = UIColor.white
        window.rootViewController = UserSearchModuleConfigurator().configure(viewController: userSearchViewController)
        window.makeKeyAndVisible()
    }

}
