//
//  HomeRequest.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation

struct HomeRequest:APIRquest{
    
    var endPoint: String{
        get{
            return "http://fyndswipenapi-­01.fyndiq.com/interview/products"
        }
    }
    
    var method: Method{
        get{
            return Method.GET
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