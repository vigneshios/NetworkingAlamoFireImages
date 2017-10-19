//
//  getMovieActorResponse.swift
//  NetworkingImagesAlamoFire
//
//  Created by vignesh on 10/19/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import Foundation

struct getMovieActorResponse {
    
    let actor :[Actor]
    
    init(json: JSON) throws {
        guard let actors = json["actors"] as? [JSON] else {throw NetorkingError.badNetworkingRequest}
        
        let actor = actors.map {Actor(json: $0)}.flatMap {$0}
        self.actor = actor
    }
    
}
