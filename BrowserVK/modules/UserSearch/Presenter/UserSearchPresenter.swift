//
//  UserSearchUserSearchPresenter.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

class UserSearchPresenter: UserSearchModuleInput, UserSearchViewOutput, UserSearchInteractorOutput {

    weak var view: UserSearchViewInput!
    var interactor: UserSearchInteractorInput!
    var router: UserSearchRouterInput!

    func viewIsReady() {
        print("ok")
    }
}
