//
//  Helper.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    static var fyndiq:UIColor{
        get{
            //#E4393A
        //253	41	57
            return UIColor(red: 253.0/255.0, green: 41.0/255.0, blue: 57.0/255.0, alpha: 1.0)
        }
        
    }
    
}


extension UIImage {
    
    // Loads image asynchronously
    class func loadFromURL(_ url: URL, callback: @escaping (UIImage)->()) {
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async(execute: {
            
            let imageData = try? Data(contentsOf: url)
            if let data = imageData {
                DispatchQueue.main.async(execute: {
                    if let image = UIImage(data: data) {
                        callback(image)
                    }
                })
            }
        })
    }
}

extension URLRequest{
    mutating func setHttpHeader(_ header:[String:Any]){
        
        for key in header.keys{
            if let body = header[key] as? String{
                self.addValue(key, forHTTPHeaderField: body)
            }
        }
    }
    
}
