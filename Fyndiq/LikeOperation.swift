//
//  LikeOperation.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation

struct LikeOperation{

    let apiRequest:APIRquest
    
    init(likeItem:LikeItem){
        self.apiRequest = LikeRequest(likeItem: likeItem)
    }
    
    func start(completion:()->(),failure:()->()){
        
        let request = NSMutableURLRequest(URL: apiRequest.endPoint)
        //request.setHttpHeader(apiRequest.defaultHeader)
        request.HTTPMethod = apiRequest.method.rawValue
        
        do{
            if let json = apiRequest.parameters as? AnyObject{
                print(json)
                let body = try NSJSONSerialization.dataWithJSONObject(json, options: [])
                request.HTTPBody = body
            }
        }
        catch{
            
        }
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in

            print(response)
        }
        task.resume()
    }

}
