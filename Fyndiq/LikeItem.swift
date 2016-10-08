//
//  Like.swift
//  Fyndiq
//
//  Created by MohamedDiaa on 10/8/16.
//  Copyright © 2016 MohamedDiaa. All rights reserved.
//

import Foundation

public enum Status {
    case liked,disLiked
}

public struct LikeItem {
    let product:Product
    let status:Status
}