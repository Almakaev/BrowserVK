//
//  UserInfoUserInfoViewInput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//
import SwiftyJSON

protocol UserInfoViewInput: class {

    /**
        @author Ilyas Almakaev
        Setup initial state of the view
    */

    func setupInitialState()
    
    func loadedUserInfo(info: JSON)
    
    func updateTableView()
}
