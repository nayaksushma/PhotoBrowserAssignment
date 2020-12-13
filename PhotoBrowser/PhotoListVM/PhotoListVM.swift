//
//  PhotoListVM.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import Foundation


class PhotoListViewModel {
    
    private var photosDirectory:PhotoDirectory?{
        didSet{
            guard let reloadData = reloadDataHandler else {
                return
            }
            reloadData()
        }
    }
        
    lazy var numberOfPhotos = {
        return self.photosDirectory?.photoList.count ?? 0
    }
        
    /// Will be invoked when any changes to the data is happens.
    var reloadDataHandler:(()->())?
    
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

//MARK:- Data Methods.
extension PhotoListViewModel {
    
    func nameForPhotoAtIndex(_ index: Int) -> String {
        return photosDirectory?.photoList[index].title ?? ""
    }
}
 
