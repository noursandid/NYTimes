//
//  ArticleViewModel.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import Foundation

class ArticleViewModel: BaseViewModel {
    typealias ViewController = ArticleViewControllerProtocol
    weak var view: ViewController? { _view as? ViewController }
    var article: Article
    init(article: Article) {
        self.article = article
    }
}

extension ArticleViewModel: ArticleViewModelProtocol { }
