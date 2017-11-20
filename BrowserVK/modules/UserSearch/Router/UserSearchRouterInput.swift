//
//  UserSearchUserSearchRouterInput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import Foundation
import UIKit

protocol UserSearchRouterInput {
    
    func openUserSearchViewController(in window: UIWindow)
    func openUserInfoViewController(navigationController: UINavigationController, id: Int)
}
