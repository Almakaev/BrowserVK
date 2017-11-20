//
//  ApiFacade.swift
//  BrowserVK
//
//  Created by Ильяс on 20.11.2017.
//  Copyright © 2017 Алмакаев Ильяс. All rights reserved.
//

import Foundation

import SwiftyVK
import SwiftyJSON

class ApiFacade: SwiftyVKDelegate {
    
    let vkAppID = "6265118"
    let scopes: Scopes = [.messages,.offline,.friends,.wall,.photos,.audio,.video,.docs,.market,.email]
    var searchResults = [JSON]()
    var userInfoResults = JSON()
    
    var interactor: UserSearchInteractorInput!
    var interactorUserInfo: UserInfoInteractorInput!
    
    var pageNumber = 0
    var currentName = ""
    
    func getNextContacts() {
        pageNumber += 20
        loadSearchedContacts(name: currentName)
    }
    
    func resetSearch() {
        searchResults = []
        pageNumber = 0
    }
    
    func loadSearchedContacts(name: String) {
        
        currentName = name

        VK.API.Users.search([.q: name, .offset: String(pageNumber), .limit: "20", .fields: "photo_50, nickname"])
            .configure(with: Config.init(httpMethod: .POST))
            .onSuccess {
                let result = JSON($0)["items"].arrayValue
                
                if result.count == 20 {
                    self.interactor.hasMore = true
                } else {
                    self.interactor.hasMore = false
                }
                
                self.searchResults += result
                
                DispatchQueue.main.async {
                    self.interactor.loadedSearchedContacts(array: self.searchResults)
                }
            }
            .onError { print("search user fail \n \($0)") }
            .send()
    }
    
    func loadUserInfo(id: Int) {
        VK.API.Users.get([.userId: String(id), .fields: "photo_200,nickname,screen_name,relation,sex"])
            .onSuccess {
                print("SwiftyVK: friends.get successed with \n \(JSON($0))")
                let result = JSON($0).arrayValue
                self.userInfoResults = result[0]
                
                DispatchQueue.main.async {
                    self.interactorUserInfo.loadedUserInfo(info: self.userInfoResults)
                }
            }
            .onError { print("SwiftyVK: friends.get failed with \n \($0)") }
            .send()
    }

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
