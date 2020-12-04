//
//  _UIViewController.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

extension UIViewController {
    static var nibName: String { String(describing: self) }
    static var bundle: Bundle { Bundle.main }
}
