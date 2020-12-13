//
//  PhotoListCell.swift
//  PhotoBrowser
//
//  Created by Sushma Nayak on 13/12/20.
//  Copyright © 2020 Sushma Nayak. All rights reserved.
//

import UIKit

class PhotoListCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        thumbImageView.sd_cancelCurrentImageLoad()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
