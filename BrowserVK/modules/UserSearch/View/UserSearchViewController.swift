//
//  UserSearchUserSearchViewController.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit

let UserSearchCellID = "UserSearchCell"

class UserSearchViewController: UIViewController, UserSearchViewInput {
    
    var output: UserSearchViewOutput!
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        let nib = UINib(nibName: "UserSearchTableViewCell", bundle: nil)
////        //       if let tableView = tableView {
////        //        tableView.dataSource = self
////        tableView.delegate = self
//        tableView.register(nib, forCellReuseIdentifier: "UserSearchCell")
////        //        }
        let nibCell = UINib(nibName: "UserSearchTableViewCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "UserSearchCell")
        output?.viewIsReady()
    }
    
    
    // MARK: UserSearchViewInput
    func setupInitialState() {
        
    }
}

extension UserSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserSearchCell", for: indexPath) as! UserSearchTableViewCell
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}



