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

    let vkAppID = "6265118"
    let scopes: Scopes = [.messages,.offline,.friends,.wall,.photos,.audio,.video,.docs,.market,.email]
    var searchResults = [JSON]()
    
    weak var output: UserSearchInteractorOutput!
    var apiFacade: ApiFacade!
    var pageString: String {
        if pageNumber == 0 {
            return "0"
        } else {
            return "\(pageNumber)"
        }
    }
    
    var pageNumber = 0
    var hasMore = false
    var currentName = ""
    
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

    func authorize() {
        apiFacade.authorize()
    }

    //TODO: add class for vk delegates
    func initVK() {
        apiFacade.initVK()
    }
}
