//
//  UserSearchUserSearchInteractorInput.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol UserSearchInteractorInput {

    func loadSearchedContacts(name: String)
    
    func loadedSearchedContacts(array: [JSON])
    
    func initVK()
    
    func resetSearch()
    
    func getNextContacts()
    
    var hasMore: Bool { get set }
}
