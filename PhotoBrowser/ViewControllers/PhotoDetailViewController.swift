//
//  PhotoDetailViewController.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 13/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoVM: PhotoListViewModel?
    var selectedIndex: IndexPath?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let index = selectedIndex?.row else {
            return
        }
        activityIndicator.startAnimating()
        photoTitleLabel.text = photoVM?.nameForPhotoAtIndex(index)
        authorNameLabel.text = photoVM?.authorNameForPhotoAtIndex(index)
        detailImageView.sd_setImage(with: URL(string: (photoVM?.URLForPhotoAtIndex(index))!)) { [weak self] (_, _, _, _) in
            self?.activityIndicator.stopAnimating()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        detailImageView.sd_cancelCurrentImageLoad()
        self.activityIndicator.stopAnimating()
    }

}
