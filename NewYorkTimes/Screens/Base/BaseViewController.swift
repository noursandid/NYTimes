//
//  BaseViewController.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    typealias ViewModel = BaseViewModel
    var _viewModel: ViewModel?
    init(viewModel: ViewModel?) {
        super.init(nibName: Self.nibName, bundle: Self.bundle)
        _viewModel = viewModel
        viewModel?._view = self
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
