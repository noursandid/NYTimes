//
//  _UICollectionViewCell.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: identifier, bundle: Bundle.main) }
}
