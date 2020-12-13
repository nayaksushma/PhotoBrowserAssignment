//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 12/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    fileprivate let photoListVM = PhotoListViewModel()
    private static let photoCellReuseIdentifier = "photoListCell"
    
    @IBOutlet weak var photoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoListVM.reloadDataHandler = {[weak self] in
            self?.photoListTableView.reloadData()
        }
        photoListTableView.estimatedRowHeight = 120
        photoListTableView.rowHeight = UITableView.automaticDimension
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}


//MARK:- UITableViewDataSource Methods.
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoListVM.numberOfPhotos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let photoCell = tableView.dequeueReusableCell(withIdentifier: ViewController.photoCellReuseIdentifier, for: indexPath) as? PhotoListCell else{
            fatalError("Failed to create photo Cell")
        }
        photoCell.titleLabel?.text = photoListVM.nameForPhotoAtIndex(indexPath.row)
        let imageURL = photoListVM.thumbURLForPhotoAtIndex(indexPath.row)
        photoCell.thumbImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder_thumb"), options: SDWebImageOptions.retryFailed, completed: nil)
        return photoCell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailVC:PhotoDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "kDetailViewController") as! PhotoDetailViewController
        detailVC.photoVM = photoListVM
        detailVC.selectedIndex = indexPath
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
