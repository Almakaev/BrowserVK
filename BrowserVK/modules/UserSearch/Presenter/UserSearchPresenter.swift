//
//  UserSearchUserSearchPresenter.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//
import SwiftyJSON

class UserSearchPresenter: UserSearchModuleInput, UserSearchViewOutput, UserSearchInteractorOutput {

    weak var view: UserSearchViewInput!
    var interactor: UserSearchInteractorInput!
    var router: UserSearchRouterInput!

    func viewIsReady() {
        print("ok")
        interactor.initVK()
    }
    
    func search(string: String) {
       interactor.loadSearchedContacts(name: string)
    }
    
    func loadedSearchedContacts(array: [JSON]) {
        view.loadedSearchedContacts(array: array)
        view.updateTableView()
    }
}
