//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let photoListVM = PhotoListViewModel()
    static let photoCellReuseIdentifier = "photoListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//MARK:- UITableViewDataSource Methods.
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoListVM.numberOfPhotos
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoCell = tableView.dequeueReusableCell(withIdentifier: ViewController.photoCellReuseIdentifier, for: indexPath) 
        return photoCell
    }

}
