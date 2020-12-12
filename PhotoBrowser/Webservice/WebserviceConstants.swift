//
//  WebserviceConstants.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import Foundation


/// Structure to hold all app level constants.
struct Constants {
    private init() {}
    static let baseURL = "https://www.reddit.com/r"
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "application/json"
}
