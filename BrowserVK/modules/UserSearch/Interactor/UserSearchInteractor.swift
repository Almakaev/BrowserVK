//
//  UserSearchUserSearchInteractor.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import SwiftyVK
import SwiftyJSON

class UserSearchInteractor: UserSearchInteractorInput {
    
    weak var output: UserSearchInteractorOutput!
    var apiFacade: ApiFacade!
    var hasMore = false
    
    func getNextContacts() {
        apiFacade.getNextContacts()
    }
    
    func resetSearch() {
        apiFacade.resetSearch()
    }

    func loadSearchedContacts(name: String) {
        apiFacade.loadSearchedContacts(name: name)
    }
    
    func loadedSearchedContacts(array: [JSON]) {
        self.output.loadedSearchedContacts(array: array)
    }

    func initVK() {
        apiFacade.initVK()
    }
}
