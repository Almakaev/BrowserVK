//
//  UserSearchUserSearchInteractor.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import SwiftyVK
import SwiftyJSON

class UserSearchInteractor: UserSearchInteractorInput, SwiftyVKDelegate {

    let vkAppID = "6265118"
    let scopes: Scopes = [.messages,.offline,.friends,.wall,.photos,.audio,.video,.docs,.market,.email]
    var searchResults = [JSON]()
    
    weak var output: UserSearchInteractorOutput!

    func loadSearchedContacts(name: String) {
        
        VK.API.Users.search([.q: "\(name)", .fields: "photo_50"])
            .configure(with: Config.init(httpMethod: .POST))
            .onSuccess {
                let result = JSON($0)["items"].arrayValue
                self.searchResults += result
                print("search user success \n \(self.searchResults)")
                
                DispatchQueue.main.async {
                    self.output.loadedSearchedContacts(array: self.searchResults)
                }
            }
            .onError { print("search user fail \n \($0)") }
            .send()
    }
    
    func authorize() {
        VK.sessions?.default.logIn(
            onSuccess: { info in
                print("BrowserVK authorize with", info)
        },
            onError: { error in
                print("BrowserVK authorize failed with", error)
        }
        )
    }
    
    //TODO: add class for vk delegates
    func initVK() {
        VK.setUp(appId: vkAppID, delegate: self)
    }
    
    func vkNeedsScopes(for sessionId: String) -> Scopes {
        return scopes
    }
    
    func vkNeedToPresent(viewController: VKViewController) {
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            rootController.present(viewController, animated: true, completion: nil)
        }
    }
    
    func vkTokenCreated(for sessionId: String, info: [String : String]) {
        
    }
    
    func vkTokenUpdated(for sessionId: String, info: [String : String]) {
        
    }
    
    func vkTokenRemoved(for sessionId: String) {
        
    }
}
