//
//  UserInfoUserInfoViewController.swift
//  BrowserVK
//
//  Created by Ilyas Almakaev on 20/11/2017.
//  Copyright © 2017 Ilyas. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

let UserInfoCellID = "UserInfoCell"

class UserInfoViewController: UIViewController, UserInfoViewInput {

    var output: UserInfoViewOutput!
    var userInfoResults = JSON()
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupInitialState()
    }


    // MARK: UserInfoViewInput
    func setupInitialState() {
        
        // configurate table view cell
        let nibCell = UINib(nibName: String(describing: UserInfoTableViewCell.self), bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: UserInfoCellID)
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        self.edgesForExtendedLayout = []
    }
    
    func loadedUserInfo(info: JSON) {
        userInfoResults = info

        navigationItem.title = "\(userInfoResults["last_name"].stringValue) \(userInfoResults["first_name"].stringValue)"
        
        let url = NSURL(string: userInfoResults["photo_200"].stringValue)!
        avatar.sd_setImage(with: url as URL, completed: nil)
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
}

extension UserInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoCellID, for: indexPath) as! UserInfoTableViewCell
        
        CellObjectFactory().configurateCell(cell: cell, row: indexPath.row, info: self.userInfoResults)
        
        return cell
    }
}
