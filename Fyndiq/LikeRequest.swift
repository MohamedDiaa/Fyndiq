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
    
    var endPoint: NSURL{
        get{
            return NSURL(string:"http://fyndswipenapi-­01.fyndiq.com/interview/products")!
        }
    }
    
    var method: Method{
        get{
            return Method.POST
        }
    }
    
    var headers: [String : Any]?{
        get{
            return nil
        }
    }
    
    var parameters: [String : Any]?{
        get{
            return nil
        }
    }
}