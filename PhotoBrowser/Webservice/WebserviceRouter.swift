//
//  WebserviceRouter.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import Foundation
import Alamofire


/// Responsible for fetching the response from the API.
final class WebserviceClient {
    private init() {}
    @discardableResult
    private static func performJSONRequest<T:Decodable>(route:WebserviceRouter, completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: JSONDecoder()){ (response: AFDataResponse<T>) in
                            completion(response.result)
                            
        }
    }
    
    static func getAllPhotos(completion:@escaping (Result<[PhotoDirectory], AFError>)->Void) {
        performJSONRequest(route: WebserviceRouter.photoList, completion: completion)
    }
}
