//
//  UserInfoUserInfoInteractorInput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol UserInfoInteractorInput {

    func loadUserInfo()
    func loadedUserInfo(info: JSON)
    var userId: Int { get set }
}
