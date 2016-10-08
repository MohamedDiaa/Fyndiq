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
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "GET"
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
         
            do{
                if let data = data ,let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [[String :Any]]
                    {
                        print(json)
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
                        completion(productsList)
                }
            }catch{
            
            }
            
        }

        task.resume()
    }
    
}


/*
 [{"image": "https://cdn.fyndiq.se/product/32/16/5f/76b1260be918f44d52fd7222bcd2fe3c12/254x254.jpg", "id": 1049719, "name": "Sk\u00e4rmskydd av h\u00e4rdat glas till iPhone 6"}, {"image": "https://cdn.fyndiq.se/product/3d/b3/b1/af2a5b72c9fc5808a14077fd3314f7acf2/254x254.jpg", "id": 3497106, "name": "Samsung original Micro usb Laddare"}, {"image": "https://cdn.fyndiq.se/product/6b/e2/95/20eed0050c4c2b950a81b9ddb3209f5935/254x254.jpg", "id": 2543817, "name": "Mobilpl\u00e5nbok iPhone 6/ 6s"}, {"image": "https://cdn.fyndiq.se/product/b8/37/c0/3c9d8ce19a024fd6741c7d88d4e845321d/254x254.jpg", "id": 579084, "name": "H\u00e4rdat glas 0.26 mm med tillbeh\u00f6r  Iphone 6 i f\u00f6rpackning"}, {"image": "https://cdn.fyndiq.se/product/15/4d/a5/4fbb30cb60f20adbcbe612c43802586bd2/254x254.jpg", "id": 3500948, "name": "Mjukisbyxor | Tr\u00e4ningsbyxor| 4 modeller"}, {"image": "https://cdn.fyndiq.se/product/22/3c/95/dcae127485a3b3d63ea15eed269e1ca9fb/254x254.jpg", "id": 3798725, "name": "Samsung Galaxy S7 Edge Transparent Skal 0.5mm"}, {"image": "https://cdn.fyndiq.se/product/80/ba/ae/5311f4169b53d64f4c2b7de5f61c0ea644/254x254.jpg", "id": 3793354, "name": "Samsung Galaxy S7 Edge Svart Skydd / Skal med displayf\u00f6nster "}, {"image": "https://cdn.fyndiq.se/product/2a/eb/7e/dccd4f1606f1fb211ae43ce85f18c839d5/254x254.jpg", "id": 2000781, "name": "Thunderbolt till HDMI adapterkabel"}, {"image": "https://cdn.fyndiq.se/product/7d/80/ba/310d69430aa0e2df2a5bd22c885a4a6e19/254x254.jpg", "id": 2380155, "name": "Original h\u00f6rlurar in-ear till Samsung Galaxy S5 EO-EG900BW"}, {"image": "https://cdn.fyndiq.se/product/8a/8a/7c/a9324ad1f93bafe395bc5bea83721573af/254x254.jpg", "id": 3065549, "name": "Langsdom H\u00f6rlurar med Mikrofon och Volymkontroll 3.5mm In-Ear"}, {"image": "https://cdn.fyndiq.se/product/90/6a/f6/54340e83f2a5146a078d9d22ff7ce495e0/254x254.jpg", "id": 3497115, "name": "Iphone 5 & 6 laddare"}, {"image": "https://cdn.fyndiq.se/product/62/2e/c2/8d085418f52ae215c546b557a8e09088ef/254x254.jpg", "id": 3497123, "name": "iphone adapter, universal"}, {"image": "https://cdn.fyndiq.se/product/79/b4/fb/05e3fa0bfeb4af58d4003c40c566b087a8/254x254.jpg", "id": 3503170, "name": "\u00c5rets hetaste TPU Skal Till Iphone 6 / 6S | Flera F\u00e4rger!"}, {"image": "https://cdn.fyndiq.se/product/d9/72/d6/a96acf91caefd130f8593beffbb12032a6/254x254.jpg", "id": 2052370, "name": "Laddare till dator 90W - 15-24V DC"}, {"image": "https://cdn.fyndiq.se/product/3f/7b/1d/da4e934291ca287bf8744ccb05a2c707c9/254x254.jpg", "id": 3229273, "name": "Solglas\u00f6gon Wayfarer - olika f\u00e4rger"}, {"image": "https://cdn.fyndiq.se/product/0c/3c/f6/364fc0826a8c2218c1aec75324fd9e5823/254x254.jpg", "id": 3818464, "name": "Copter Sk\u00e4rmskydd till Samsung Galaxy S7 Edge"}, {"image": "https://cdn.fyndiq.se/product/18/97/f2/964e66785712c499b42311ba9c90f0c7e0/254x254.jpg", "id": 547616, "name": "H\u00e4rdat glas f\u00f6r iPhone 6/6S - 0.25mm"}, {"image": "https://cdn.fyndiq.se/product/44/bc/41/c7b0d1a5c8dfa9c21bc86928834e99f76f/254x254.jpg", "id": 1790510, "name": "Mobilh\u00e5llare f\u00f6r Bil"}, {"image": "https://cdn.fyndiq.se/product/eb/ce/d6/632fbde5589783b608bd2798d17c34f83e/254x254.jpg", "id": 2591678, "name": "D:fi Extreme Cream 150g"}, {"image": "https://cdn.fyndiq.se/product/3f/2d/e6/6f20da74b3508b0052d4ac0f7040c3ca10/254x254.jpg", "id": 3463746, "name": "Sk\u00e4rmskydd av h\u00e4rdat glas t\u00e4cka hela sk\u00e4rmen p\u00e5 Samsung edge +"}, {"image": "https://cdn.fyndiq.se/product/79/08/cf/d8a2485d73afe3e916c7010852f8fdfcbb/254x254.jpg", "id": 3768192, "name": "Mobilskal Samsung Galaxy S7 Edge transparent"}, {"image": "https://cdn.fyndiq.se/product/43/3d/c9/587fa852707fd60c805b7802dbcf794d8e/254x254.jpg", "id": 3793375, "name": "Samsung Galaxy S7 Svart Cover / Skydd / Skal med displayf\u00f6nster "}, {"image": "https://cdn.fyndiq.se/product/8f/c8/df/0f8b2e09832639f395549b6ad14c539582/254x254.jpg", "id": 524436, "name": "H\u00f6rlurar iPhone 3.5mm Mic och Volymkontroll"}, {"image": "https://cdn.fyndiq.se/product/57/20/e4/c5ea17edd1f111413b95191068f6feefa2/254x254.jpg", "id": 1557931, "name": "H\u00e4rdat glas sk\u00e4rmskydd Sony Xperia M4 Aqua - Tempered glass"}, {"image": "https://cdn.fyndiq.se/product/61/df/ad/1c22bf238f4c82fc4f927b4f75fc59285b/254x254.jpg", "id": 1592517, "name": "Armband Ankare \u00e4kta mjuk l\u00e4der Unisex"}, {"image": "https://cdn.fyndiq.se/product/08/6e/da/3d7c7e68f8722179f24b23df318af469c9/254x254.jpg", "id": 2380496, "name": "Plantronics Bluetooth Headset Voyager Legend"}, {"image": "https://cdn.fyndiq.se/product/2f/b4/92/a6d97346d06fe56e767ee38abaa8e8ddd8/254x254.jpg", "id": 2632988, "name": "Fodral till Macbook 13 Retina - Ullfilt"}, {"image": "https://cdn.fyndiq.se/product/67/7e/d6/1a12fbf9d0e0d9e6ea4b9befc36ece8ee5/254x254.jpg", "id": 3065523, "name": "Langsdom H\u00f6rlurar med Mikrofon och Volymkontroll 3.5mm In-Ear"}, {"image": "https://cdn.fyndiq.se/product/b7/80/9a/97e26eeceb79a917de516f2775921151c0/254x254.jpg", "id": 3774216, "name": "Samsung Galaxy s7  Edge Armor mobilskal"}, {"image": "https://cdn.fyndiq.se/product/2d/90/41/759e5140b420fa926b46e9bd0c5c17d94e/254x254.jpg", "id": 3798729, "name": "Samsung Galaxy S7 Transparent silikonskal 0.5mm"}, {"image": "https://cdn.fyndiq.se/product/6c/76/3c/159500106b82228026eafad2c85905fbc2/254x254.jpg", "id": 3815838, "name": "Samsung Galaxy S7 PRO+ Displayskydd / sk\u00e4rmskydd h\u00e4rdat glas 9H"}, {"image": "https://cdn.fyndiq.se/product/4f/48/31/af53a2d2ba99caf20a7c2afaa84652f278/254x254.jpg", "id": 3887476, "name": "Ultratunn Mjuk Skal Samsung Galaxy S7 EDGE   Genomskinligt"}, {"image": "https://cdn.fyndiq.se/product/2f/dd/82/718752a97ae10d9103da0b3e170efa91aa/254x254.jpg", "id": 561843, "name": "Sportarmband f\u00f6r iPhone 6 (4.7\") Med plats f\u00f6r nyckel"}, {"image": "https://cdn.fyndiq.se/product/dc/9b/28/72b5209b57e570ae602f8212ac30ca5255/254x254.jpg", "id": 1080355, "name": "BMW M dekal till grillen"}, {"image": "https://cdn.fyndiq.se/product/e4/a1/cb/d52f7a42aa42f01962db1b3d0ff96a7f6d/254x254.jpg", "id": 1614112, "name": "H\u00e4rdat glas Sk\u00e4rmskydd LG G3 - Tempered glass"}, {"image": "https://cdn.fyndiq.se/product/47/14/e6/e1ae43ebf61c7aae123e8e962f33e80fc8/254x254.jpg", "id": 1641279, "name": "\u00d6ka din syreupptagningsf\u00f6rm\u00e5ga med Elevation Training Mask 2.0"}, {"image": "https://cdn.fyndiq.se/product/38/d6/af/77ed57bb2aa780a856a0187927b72f3a1f/254x254.jpg", "id": 1976150, "name": "iPhone 6 & 6S NYHET skal med kort/sedel fack p\u00e5 baksidan"}, {"image": "https://cdn.fyndiq.se/product/5b/fb/09/82a8976fa1a0a7b77413eaee9e0475e7e3/254x254.jpg", "id": 2648602, "name": "GoPro tillbeh\u00f6rskit 6-delar"}, {"image": "https://cdn.fyndiq.se/product/83/07/ee/0f6f2927695916f1722e0af07af8cecfd5/254x254.jpg", "id": 2798443, "name": "Iphone 4 laddare"}, {"image": "https://cdn.fyndiq.se/product/83/75/e1/f01649a74cc392506aff7bb37bc6ad3fe9/254x254.jpg", "id": 2840903, "name": "Huawei Nexus 6P H\u00e4rdat Glas Sk\u00e4rmskydd 0,3mm"}, {"image": "https://cdn.fyndiq.se/product/e6/db/a1/0ef85c4571f18a7b16941e1db6ed4264a6/254x254.jpg", "id": 3117436, "name": "FM-s\u00e4ndare med Bluetooth \u2013 spela musik fr\u00e5n din mobiltelefon"}, {"image": "https://cdn.fyndiq.se/product/24/e8/2d/f5b24ed70b8959eff7ed58273f8a3c40bf/254x254.jpg", "id": 3210629, "name": "H\u00e4rdat glas Sony Z3 Compact"}, {"image": "https://cdn.fyndiq.se/product/19/39/f0/3cb89f975ae8d07182f7cfeafcc02c926e/254x254.jpg", "id": 3323880, "name": "Samsung Galaxy S5 Batteri - Original"}, {"image": "https://cdn.fyndiq.se/product/9e/20/2c/974b8d403ddbdf0ad6572aa38059f2b868/254x254.jpg", "id": 3427246, "name": "ZAGG InvisibleShield Dry\u2122 HD till Samsung Galaxy S7 Edge"}, {"image": "https://cdn.fyndiq.se/product/3f/aa/5c/d86e1e6519f8d037247172e9c8caf98a8b/254x254.jpg", "id": 3442310, "name": "Pl\u00e5nboksfodral med kortfack svart, Samsung Galaxy S7"}, {"image": "https://cdn.fyndiq.se/product/5b/2a/2b/9688bbd1eb2f1977bb5e1f8493a7946df9/254x254.jpg", "id": 3487713, "name": "Transparent Skal Apple iPhone 6/6S - Anti-scratch"}, {"image": "https://cdn.fyndiq.se/product/5f/b5/e4/00657f25565d8f87bdac19b1b82566def3/254x254.jpg", "id": 3507343, "name": "Sk\u00e4rmskydd 0.26 mm B\u00d6JT GLAS f\u00f6r Galaxy S6 Edge, Transparent"}, {"image": "https://cdn.fyndiq.se/product/8d/e8/4d/8a0fe81852e4b1e3153f4d3518af749245/254x254.jpg", "id": 3524042, "name": "Damm och smutsskydd f\u00f6r Iphone 6 / 6S / 6S Plus + Ipad"}, {"image": "https://cdn.fyndiq.se/product/0b/04/21/c572ffef43b2c186ef82706e049f69db0e/254x254.jpg", "id": 3551179, "name": "Sony Xperia M4 H\u00e4rdat glas 0.26mm 2.5D"}, {"image": "https://cdn.fyndiq.se/product/32/5d/3f/7a74050d1eb698fb26f76557fd4b1254b8/254x254.jpg", "id": 3620112, "name": "St\u00f6tt\u00e5ligt Skal med st\u00f6d | Sony Xperia Z5 Compact"}]
 */