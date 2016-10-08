//
//  HomeTableViewCell.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var productImgView:UIImageView!
    @IBOutlet var likeButton:UIButton!
    
    internal var product:Product?{
    
        didSet{
            if let p = self.product{
                nameLabel.text = p.name
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
