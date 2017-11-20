//
//  UserSearchUserSearchViewController.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 17/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit
import SwiftyJSON

let UserSearchCellID = "UserSearchCell"

class UserSearchViewController: UIViewController, UserSearchViewInput {
    
    var output: UserSearchViewOutput!
    var searchResults = [JSON]()
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

        // configurate table view cell
        let nibCell = UINib(nibName: String(describing: UserSearchTableViewCell.self), bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: UserSearchCellID)
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        // configurate search controller
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.titleView = searchController.searchBar
        self.searchController.searchBar.becomeFirstResponder()

        definesPresentationContext = true
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
    
    func loadedSearchedContacts(array: [JSON]) {
        searchResults = array
    }
}

extension UserSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserSearchCellID, for: indexPath) as! UserSearchTableViewCell
        
        let contact = searchResults[indexPath.row]
        cell.contact = contact

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        output.checkPagination(index: indexPath.row, arrayCount: searchResults.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let id = searchResults[row]["id"].intValue
        output.openUserInfoViewController(navigationController: self.navigationController!, id: id)
    }
}

extension UserSearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchResults = []
        output.resetSearch()
        output.search(string: searchBar.text!)
    }
}



