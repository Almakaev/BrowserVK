//
//  UserInfoUserInfoInteractorOutput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol UserInfoInteractorOutput: class {

    func loadedUserInfo(info: JSON)
}
