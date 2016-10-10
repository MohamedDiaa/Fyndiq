//
//  APIRequest.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation

enum Method:String {
    case GET,PUT,POST,DELETE
}

protocol APIRquest{
    
    var endPoint:URL{get}
    
    var headers:[String:AnyObject]?{get}
    
    var method:Method{get}
    
    var parameters:[String:AnyObject]?{get}
    
    
}

extension APIRquest{
    var defaultHeader:[String:Any]{
        get{
            return ["Content-Type" : "application/json; charset=utf-8"]
        }
    }
}
