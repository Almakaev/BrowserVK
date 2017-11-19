//
//  UserSearchUserSearchInteractorOutput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol UserSearchInteractorOutput: class {
    
    func loadedSearchedContacts(array: [JSON])
}
