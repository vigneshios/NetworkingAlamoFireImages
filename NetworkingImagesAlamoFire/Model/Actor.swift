//
//  Actors.swift
//  NetworkingImagesAlamoFire
//
//  Created by vignesh on 10/19/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import Foundation
struct Actor {
    let name:String
    let imageUrl:String
    
    init?(json:JSON) {
        guard let name = json["name"] as? String,
            let imageurl = json["image"] as? String
        else {return nil}
        
        self.name = name
        self.imageUrl = imageurl
    }
}
