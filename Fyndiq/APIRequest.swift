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
    
    var endPoint:NSURL{get}
    
    var headers:[String:Any]?{get}
    
    var method:Method{get}
    
    var parameters:[String:Any]?{get}
    
    
}

extension APIRquest{
    var defaultHeader:[String:Any]{
        get{
            return ["Content-Type" : "application/json; charset=utf-8"]
        }
    }
}