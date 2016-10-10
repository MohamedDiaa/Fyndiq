//
//  HomeRequest.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation

struct HomeRequest:APIRquest{
    
    
    var endPoint: URL{
        get{
            
            let s = "http://fyndswipenapi-­01.fyndiq.com/interview/products"
            if let str = s.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed),let url = URL(string:str){
                return url
            }
            return URL(string: "http://Google.com")!
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

