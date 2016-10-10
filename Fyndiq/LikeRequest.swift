//
//  LikeRequest.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation

struct LikeRequest:APIRquest {
    
    let likeItem:LikeItem
    
    init(likeItem:LikeItem){
        
        self.likeItem = likeItem
    }
    
    var endPoint: URL{
        get{
            
            let s = "http://fyndswipenapi-­01.fyndiq.com/interview/products"
            if let url = URL(string:s){
                return url
            }
            return URL(string: "http://Google.com")!
        }
    }
    
    var method: Method{
        get{
            return Method.POST
        }
    }
    
    var headers: [String : AnyObject]?{
        get{
            return nil
        }
    }
    
    var parameters: [String : AnyObject]?{
        get{
            switch(likeItem.status){
            case .liked:
                return ["id":likeItem.product.id as AnyObject,"like":true as AnyObject]
            case .none:
                return ["id":likeItem.product.id as AnyObject,"like":false as AnyObject]
            }
        }
    }
}
