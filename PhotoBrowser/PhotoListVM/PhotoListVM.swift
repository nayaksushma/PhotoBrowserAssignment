//
//  PhotoListVM.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import Foundation

enum PhotoVMState{
    case fetchingContent
    case loaded
    case filtering
}


class PhotoListViewModel {
    
    private var photosDirectory: PhotoDirectory?{
        didSet{
            guard let reloadData = reloadDataHandler else {
                return
            }
            reloadData()
        }
    }
    
    private var filteredDirectory: PhotoDirectory? = nil {
        didSet{
            guard let _ = filteredDirectory else{
                state = .loaded
                reloadDataHandler!()
                return
            }
            state = .filtering
            reloadDataHandler!()
        }
    }
    
    private(set) var state:PhotoVMState
        
    lazy var numberOfPhotos = {
        return self.currentStateDirectory()?.photoList.count ?? 0
    }
        
    /// Will be invoked when any changes to the data is happens.
    var reloadDataHandler:(()->())?
    
    init() {
        state = .fetchingContent
        fetchPhotosList()
    }
}

//MARK:- Data Fetch.
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
    
    private func currentStateDirectory() -> PhotoDirectory? {
        switch state {
        case .filtering:
            return filteredDirectory
        default:
            return photosDirectory
        }
    }
    
    func nameForPhotoAtIndex(_ index: Int) -> String {
        return currentStateDirectory()?.photoList[index].title ?? ""
    }
    
    func authorNameForPhotoAtIndex(_ index: Int) -> String {
        return currentStateDirectory()?.photoList[index].authorName ?? ""
    }
    
    func thumbURLForPhotoAtIndex(_ index: Int) -> String {
        return currentStateDirectory()?.photoList[index].thumbnailImageURL ?? ""
    }
    
    func URLForPhotoAtIndex(_ index: Int) -> String {
        return currentStateDirectory()?.photoList[index].detailImageURL ?? ""
    }

}
 
//MARK:- Data Filter.
extension PhotoListViewModel {
    
    func filterTitleWithQuery(_ queryText: String) {
        
        guard let filteredPhotos = photosDirectory?.photoList.filter({ return  $0.title.lowercased().contains(queryText.lowercased()) }) else {
            return
        }
        filteredDirectory = PhotoDirectory(with: filteredPhotos)
    }
    
    func cancelFiltering() {
        filteredDirectory = nil
    }
}
