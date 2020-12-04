//
//  MediaCollectionViewCell.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var caption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(withMedia media: Media) {
        self.caption.text = media.caption
        if let metaData = media.mediaMetadata {
            if metaData.count > 0 {
                self.imageView.loadURLString(metaData.last?.url)
            }
        }
    }
}
