//
//  UserSearchAIUserSearchPresenter.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 16/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

class UserSearchPresenter: UserSearchModuleInput, UserSearchViewOutput, UserSearchInteractorOutput {

    weak var view: UserSearchViewInput!
    var interactor: UserSearchInteractorInput!
    var router: UserSearchRouterInput!

    func viewIsReady() {

    }
}
