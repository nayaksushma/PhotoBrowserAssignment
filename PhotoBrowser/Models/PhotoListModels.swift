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
    
    enum CodingKeys: CodingKey {
      case data
    }
    
    private enum DataCodingKeys: String, CodingKey {
        case children
    }
    
    init(from decoder: Decoder) throws {
        let dataContainer = try decoder.container(keyedBy: CodingKeys.self)
        let collection = try dataContainer.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        photoList = try collection.decode([Photo].self, forKey: .children)
    }
    
    init(with photos: [Photo]) {
        photoList = photos
    }
}

struct Photo: Decodable, Equatable {
    let title: String
    let authorName: String?
    let thumbnailImageURL: String?
    let detailImageURL: String?
    
    enum CodingKeys: CodingKey {
      case data
    }
    
    private enum DataCodingKeys: String, CodingKey {
        case title
        case authorName = "author_fullname"
        case thumbnailImageURL = "thumbnail"
        case detailImageURL = "url"
    }
    
    init(from decoder: Decoder) throws {
        let dataContainer = try decoder.container(keyedBy: CodingKeys.self)
        let collection = try dataContainer.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        title = try collection.decode(String.self, forKey: .title)
        authorName = try collection.decode(String.self, forKey: .authorName)
        thumbnailImageURL = try collection.decode(String.self, forKey: .thumbnailImageURL)
        detailImageURL = try collection.decode(String.self, forKey: .detailImageURL)
    }
    
    init(with title: String, author: String?, thumbURL: String?, detailURL: String?) {
        self.title = title
        self.authorName = author
        thumbnailImageURL = thumbURL
        detailImageURL = detailURL
    }
}
