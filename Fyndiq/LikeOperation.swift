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
    
    func start(_ completion:()->(),failure:()->()){
        
        var request = URLRequest(url: apiRequest.endPoint as URL)
        //request.setHttpHeader(apiRequest.defaultHeader)
        request.httpMethod = apiRequest.method.rawValue
        
        do{
            if let json = apiRequest.parameters{
                print(json)
                let body = try JSONSerialization.data(withJSONObject: json, options: [])
                request.httpBody = body
            }
        }
        catch{
            
        }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in

            print(response)
        }) 
        task.resume()
        
    }

}
