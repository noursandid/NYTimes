//
//  ArticleViewController.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

class ArticleViewController: BaseViewController {
    typealias ViewModel = ArticleViewModelProtocol
    unowned var viewModel: ViewModel! { _viewModel as? ViewModel }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
            self.collectionView.register(MediaCollectionViewCell.nib,
                                         forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
        }
    }
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var goToButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goToButton.setTitle(viewModel.article.source, for: .normal)
        self.abstractLabel.text = viewModel.article.abstract
        self.title = viewModel.article.title
        self.abstractLabel.numberOfLines = -1
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let collectionViewLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let size: CGFloat = min(self.collectionView.frame.width/2,
                                    self.collectionView.frame.size.height - 16)
            collectionViewLayout.itemSize = CGSize(width: size, height: size)
            collectionViewLayout.scrollDirection = .horizontal
            if let media = viewModel.article.media {
                let totalCellWidth = size * CGFloat(media.count)
                let totalSpacingWidth = 4 * (media.count - 1)
                let maximumWidth = self.collectionView.frame.width - totalCellWidth
                let horizontalInset = ( maximumWidth + CGFloat(totalSpacingWidth)) / 2
                self.collectionView.contentInset = UIEdgeInsets(top: 0, left: horizontalInset,
                                                                bottom: 0, right: horizontalInset)
            }
        }
    }
    @IBAction func goToButtonPressed(_ sender: Any) {
        guard let url = URL(string: viewModel.article.url!) else {
            return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    deinit {
        print("deinit")
    }
}

extension ArticleViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.article.media?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier,
                                 for: indexPath) as? MediaCollectionViewCell
        else { fatalError() }
        if let media = viewModel.article.media {
            collectionViewCell.configureCell(withMedia: media[indexPath.row])
        }
        return collectionViewCell
    }
}
