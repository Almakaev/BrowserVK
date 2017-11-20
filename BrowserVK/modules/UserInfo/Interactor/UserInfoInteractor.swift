//
//  UserInfoUserInfoInteractor.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//
import SwiftyJSON

class UserInfoInteractor: UserInfoInteractorInput {

    weak var output: UserInfoInteractorOutput!
    var apiFacade: ApiFacade!
    var userId: Int = 0

    func loadUserInfo() {
        apiFacade.loadUserInfo(id: userId)
    }
    
    func loadedUserInfo(info: JSON) {
        self.output.loadedUserInfo(info: info)
    }
}
