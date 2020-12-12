//
//  WebserviceClient.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import Foundation
import Alamofire

/// Enumeration Used to construct url requests.
enum WebserviceRouter: URLRequestConvertible {
    
    case photoList
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .photoList:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .photoList:
            return "/data/sessions.json"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .photoList:
            return nil
        }
    }
    
    // MARK: - `URLRequest` creation.
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
