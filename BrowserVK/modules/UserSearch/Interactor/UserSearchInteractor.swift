//
//  UserSearchUserSearchInteractor.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//
import Alamofire
import SwiftyVK
import SwiftyJSON

class UserSearchInteractor: UserSearchInteractorInput, SwiftyVKDelegate {

    let vkAppID = "6265118"
    let scopes: Scopes = [.messages,.offline,.friends,.wall,.photos,.audio,.video,.docs,.market,.email]
    
    weak var output: UserSearchInteractorOutput!

    func loadSearchedContacts(name: String) {
        VK.API.Users.search([.q: "\(name)"])
            .configure(with: Config.init(httpMethod: .POST))
            .onSuccess { print("SwiftyVK: users.get successed with \n \(JSON($0))") }
            .onError { print("SwiftyVK: friends.get fail \n \($0)") }
            .send()
    }
    
    func authorize() {
        VK.sessions?.default.logIn(
            onSuccess: { info in
                print("SwiftyVK: success authorize with", info)
        },
            onError: { error in
                print("SwiftyVK: authorize failed with", error)
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
