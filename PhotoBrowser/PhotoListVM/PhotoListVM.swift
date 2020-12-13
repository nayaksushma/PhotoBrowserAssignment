//
//  PhotoListVM.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import Foundation


class PhotoListViewModel {
    
    private var photosDirectory:PhotoDirectory?
    
    lazy var numberOfPhotos: Int = {
        return self.photosDirectory?.photoList.count ?? 0
    }()
    
    init() {
        fetchPhotosList()
    }
}

extension PhotoListViewModel {
    fileprivate func fetchPhotosList() {
        WebserviceClient.getAllPhotos { [weak self] (result) in
            switch result{
            case .success(let photoDirectory):
                self?.photosDirectory = photoDirectory
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}
