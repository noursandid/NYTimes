//
//  ArticleTableViewCell.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articletitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.articletitleLabel.numberOfLines = 2
        self.articleDescriptionLabel.numberOfLines = 2
        self.articleImageView.clipsToBounds = true
        self.articleImageView.layer.cornerRadius = 30
        self.articleImageView.layer.borderColor = UIColor.gray.cgColor
    }
    func configureCell(withArticle article: Article) {
        self.articletitleLabel.text = article.title
        self.articleDescriptionLabel.text = article.abstract
        self.articleDateLabel.text = article.publishedDate?.representableString()
        self.articleImageView.image = nil
        if let firstMedia = article.media?.first,
            let firstMetaData = firstMedia.mediaMetadata?.first {
            self.articleImageView.loadURLString(firstMetaData.url)
        }
    }
}
