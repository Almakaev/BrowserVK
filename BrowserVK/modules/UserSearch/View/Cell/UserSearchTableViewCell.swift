//
//  UserSearchTableViewCell.swift
//  BrowserVK
//
//  Created by Ильяс on 18.11.2017.
//  Copyright © 2017 Алмакаев Ильяс. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class UserSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    var contact: JSON = [] {
        didSet {
            fullName.text = "\(contact["last_name"].stringValue) \(contact["first_name"].stringValue)"
            let url = NSURL(string: contact["photo_50"].stringValue)!
            avatar.sd_setImage(with: url as URL, completed: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
