//
//  PhotoListModels.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import Foundation

struct PhotoDirectory: Decodable {
    let photoList: [Photo]
}

struct Photo: Decodable {
    let title: String
    let authorName: String
    let thumbnailImageURL: String?
    let detailImageURL: String?
}
