//
//  _UIImageView.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadURLString(_ urlString: String?) {
        guard let url = URL(string: urlString ?? "") else { return }
        loadURL(url)
    }
    func loadURL(_ url: URL) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url,
                         options: [
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(1)),
                            .cacheOriginalImage
        ]) { (result) in
            switch result {
            case .success(let image):
                self.image = image.image
            case .failure:
                break
            }
        }
    }
}
