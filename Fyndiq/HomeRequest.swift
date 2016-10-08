//
//  HomeRequest.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation

struct HomeRequest:APIRquest{
    
    
    var endPoint: NSURL{
        get{
            
            let s = "http://fyndswipenapi-­01.fyndiq.com/interview/products"
            if let str = s.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLFragmentAllowedCharacterSet()),let url = NSURL(string:str){
                return url
            }
            return NSURL(string: "http://Google.com")!
           }
    }
    
    var method: Method{
        get{
            return Method.GET
        }
    }
    
    var headers: [String : AnyObject]?{
        get{
            return nil
        }
    }
    
    var parameters: [String : AnyObject]?{
        get{
            return nil
        }
    }
}

