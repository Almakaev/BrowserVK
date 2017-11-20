//
//  UserSearchUserSearchViewInput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//
import SwiftyJSON

protocol UserSearchViewInput: class {

    /**
        @author Ilyas Almakaev
        Setup initial state of the view
    */

    func setupInitialState()
    
    func updateTableView()
    
    func loadedSearchedContacts(array: [JSON])
    
    func startAnimatingActivityIndicator()
    
    func stopAnimatingActivityIndicator()
}
