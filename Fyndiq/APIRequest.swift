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
    
    var endPoint:String{get}
    
    var headers:[String:Any]?{get}
    
    var method:Method{get}
    
    var parameters:[String:Any]?{get}
}