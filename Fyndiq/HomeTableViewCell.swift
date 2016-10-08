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
                
                // First of all remove the old image (required for images in cells)
                productImgView.image = UIImage(named:"Loading")
                
                // Load image and apply to the view
                UIImage.loadFromURL(p.image, callback: { (loadedImage: UIImage) -> () in
                    self.productImgView.image = loadedImage
                })

                switch(p.status){
                case .liked:
                    self.likeButton.setTitle("UnLike", forState: UIControlState.Normal)
                case .none:
                    self.likeButton.setTitle("Like", forState: UIControlState.Normal)
                }
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
    
    @IBAction func likePressed(sender:UIButton){
        if let p = self.product{
        
            switch(p.status){
            case .liked:
                self.product?.status = .none
                self.likeButton.setTitle("Like", forState: UIControlState.Normal)

                let likeItem = LikeItem(product: p, status: .none)
                self.startLikeOperation(likeItem)
            
            case .none:
                self.product?.status = .liked
                self.likeButton.setTitle("UnLike", forState: UIControlState.Normal)
               
                let likeItem = LikeItem(product: p, status: .none)
                self.startLikeOperation(likeItem)
            }
        }
    }
    
    func startLikeOperation(likeItem:LikeItem){
        let likeOp = LikeOperation(likeItem: likeItem)
        likeOp.start({ 
            
            }) { 
                
        }
    }
    
}
