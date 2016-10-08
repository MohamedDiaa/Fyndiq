//
//  HomeOperation.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import UIKit

class HomeOperation {

    let apiRequest:APIRquest
  
    init(){
        
        self.apiRequest = HomeRequest()
    }

    
    func start(completion:([Product] -> Void)){
        
        let request = NSMutableURLRequest(URL: apiRequest.endPoint)
        apiRequest.defaultHeader
        request.setHttpHeader(apiRequest.defaultHeader)
        request.HTTPMethod = apiRequest.method.rawValue
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in

            do{
                if let data = data ,let json = try NSJSONSerialization.JSONObjectWithData(data, options: [.AllowFragments]) as? [[String:AnyObject]]{
                    
                    if let productList = self.parse(json){
                        
                        completion(productList)
                    }
                }
            }catch let error as NSError {
                print("json error: \(error.localizedDescription)")
                
                if let productJson = self.loadSavedFile(),let productList = self.parse(productJson){
                    
                    completion(productList)
                }
            }
        }

        task.resume()
        
    }

    func loadSavedFile()->[[String:AnyObject]]?{
        
        let path = NSBundle.mainBundle().pathForResource("fyndiq.json", ofType: nil) ?? ""
        let loadedData = NSData(contentsOfFile: path)
        do{
            if let newLoadeddata = loadedData ,let json = try NSJSONSerialization.JSONObjectWithData(newLoadeddata, options: .AllowFragments) as? [[String:AnyObject]]{
                
                return json
            }
        }
        catch let error as NSError{
            print(error)
        }
        
        return nil
    }

    func parse(json:[[String:AnyObject]]) -> [Product]?{
    
    var productsList = [Product]()
    for item in json{
        let image = item["image"] as? String
        let name = item["name"] as? String
        let id = item["id"] as? Int
        
        if let image = image ,let imageURL = NSURL(string:image),let name = name , let id = id{
            
            let product = Product(id: id, image: imageURL, name: name, status: Status.none)
            
            productsList.append(product)
        }
    }

    return  (productsList.count > 0) ? productsList : nil
}

}