//
//  NetworkingService.swift
//  NetworkingImagesAlamoFire
//
//  Created by vignesh on 10/19/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class NetworkingService {
    
    static let shared = NetworkingService()
    private init(){}
    
    func getMovieStarsDetails(success successblock:@escaping (getMovieActorResponse)-> Void) {
        
        Alamofire.request(ActorsURL).responseJSON { (response) in
            guard let json = response.result.value as? JSON else {return }
            print(json)
            
            do {
                let jsonResponse = try getMovieActorResponse(json: json)
                successblock(jsonResponse)
            }catch {
                print(error)
            }
            
        }
    
    }
}
