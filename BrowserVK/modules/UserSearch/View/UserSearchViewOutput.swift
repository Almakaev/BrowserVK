//
//  UserSearchUserSearchViewOutput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//
import Foundation
import UIKit

protocol UserSearchViewOutput {

    /**
        @author Ilyas Almakaev
        Notify presenter that view is ready
    */

    func viewIsReady()
    func resetSearch()
    func search(string: String)
    func checkPagination(index: Int, arrayCount: Int)
    func openUserInfoViewController(navigationController: UINavigationController, id: Int)
}
