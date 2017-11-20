//
//  UserInfoUserInfoPresenter.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//
import SwiftyJSON

class UserInfoPresenter: UserInfoModuleInput, UserInfoViewOutput, UserInfoInteractorOutput {

    weak var view: UserInfoViewInput!
    var interactor: UserInfoInteractorInput!
    var router: UserInfoRouterInput!

    func viewIsReady() {
        interactor.loadUserInfo()
    }
    
    func loadedUserInfo(info: JSON) {
        view.loadedUserInfo(info: info)
        view.updateTableView()
    }
}
