//
//  PhotoBrowserTests.swift
//  PhotoBrowserTests
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class PhotoBrowserTests: XCTestCase {
    
    let samplePhotoList: [Photo] = [Photo(with: "Lorem Ipsum is simply",author: nil, thumbURL: nil, detailURL: nil),
    Photo(with: "Industry's standard dummy text ever since the 1500s",author: nil, thumbURL: nil, detailURL: nil),
    Photo(with: "It has survived not only five centuries",author: nil, thumbURL: nil, detailURL: nil),
    Photo(with: "'Content here, content here', ",author: nil, thumbURL: nil, detailURL: nil),
    Photo(with: "(injected humour and the like here)",author: nil, thumbURL: nil, detailURL: nil)]
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFilterForSingleMatch() {
        let photoVM = samplePhotoVM()
        let result = photoVM.filteredPhotosForQuery("content")
        XCTAssertEqual(result!, [samplePhotoList[3]])
        
    }
    
    func testFilterForMultipleMatch() {
        let photoVM = samplePhotoVM()
        let result = photoVM.filteredPhotosForQuery("here")
        XCTAssertEqual(result!, [samplePhotoList[3], samplePhotoList[4]])
    }
    
    
    func testFilterForNoMatch() {
        let photoVM = samplePhotoVM()
        let result = photoVM.filteredPhotosForQuery("xyzam ")
        XCTAssertEqual(result, [])
    }
    
    func testFilterForSpecialCharacter() {
        let photoVM = samplePhotoVM()
        let result = photoVM.filteredPhotosForQuery("(inj")
        XCTAssertEqual(result, [samplePhotoList[4]])
    }
    
    func testFilterForCaseInsensitivity() {
        let photoVM = samplePhotoVM()
        let result = photoVM.filteredPhotosForQuery("IPSUM")
        XCTAssertEqual(result, [samplePhotoList[0]])
    }
    
    func testFilterFlow1() {
        let photoVM = samplePhotoVM()
        photoVM.filterTitleWithQuery("test")
        photoVM.cancelFiltering()
        XCTAssertEqual(PhotoVMState.loaded, photoVM.state)
    }
    
    func testFilterFlow2() {
        let photoVM = samplePhotoVM()
        photoVM.filterTitleWithQuery("test")
        photoVM.filterTitleWithQuery("test2")
        XCTAssertEqual(PhotoVMState.filtering, photoVM.state)
    }
    
    func testNoPhotos() {
        let photoDir = PhotoDirectory(with: [])
        let photoVM = PhotoListViewModel(directory: photoDir)
        XCTAssertEqual("", photoVM.nameForPhotoAtIndex(0))
    }
    
    private func samplePhotoVM() -> PhotoListViewModel {
        let photoDir = PhotoDirectory(with: samplePhotoList)
        return PhotoListViewModel(directory: photoDir)
    }


}
