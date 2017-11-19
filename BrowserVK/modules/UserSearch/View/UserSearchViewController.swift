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
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        output.viewIsReady()
    }

    // MARK: UserSearchViewInput
    func setupInitialState() {
        
        // configurate table view
        let nibCell = UINib(nibName: String(describing: UserSearchTableViewCell.self), bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: UserSearchCellID)
        
        // configurate search controller
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.titleView = searchController.searchBar
        self.searchController.searchBar.becomeFirstResponder()
    }
}

extension UserSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserSearchCellID, for: indexPath) as! UserSearchTableViewCell
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension UserSearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }

}



