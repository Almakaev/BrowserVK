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
        interactor.initVK()
    }
    
    func search(string: String) {
       interactor.loadSearchedContacts(name: string)
    }
    
    func resetSearch() {
        interactor.resetSearch()
    }
    
    func loadedSearchedContacts(array: [JSON]) {
        view.loadedSearchedContacts(array: array)
        view.updateTableView()
    }
    
    func openUserInfoViewController(navigationController: UINavigationController, id: Int) {
        router.openUserInfoViewController(navigationController: navigationController, id: id)
    }
    
    func checkPagination(index: Int, arrayCount: Int) {
        print("indexCell \(index) arrayCount \(arrayCount)")
        if index == arrayCount - 1 {
            print("moreDataCheck")
            if interactor.hasMore {
                print("moreData")
                interactor.getNextContacts()
            }
        }
    }
}
