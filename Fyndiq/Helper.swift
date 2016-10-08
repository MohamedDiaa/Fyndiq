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
    class func loadFromURL(url: NSURL, callback: (UIImage)->()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            
            let imageData = NSData(contentsOfURL: url)
            if let data = imageData {
                dispatch_async(dispatch_get_main_queue(), {
                    if let image = UIImage(data: data) {
                        callback(image)
                    }
                })
            }
        })
    }
}