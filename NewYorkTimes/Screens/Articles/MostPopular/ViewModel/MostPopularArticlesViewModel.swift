//
//  MostPopularArticleViewModel.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import Foundation

class MostPopularArticlesViewModel: BaseViewModel {
    typealias ViewController = MostPopularArticlesViewControllerProtocol
    weak var view: ViewController? { _view as? ViewController }
    var articles: [Article] = []
}

extension MostPopularArticlesViewModel: MostPopularArticlesViewModelProtocol {
    func getArticles() {
        Repository.current.getMostViewedArticles(period: .month) {[weak self] (result) in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.view?.articlesLoaded()
            case .failure(let error):
                error.handle { [weak self] in
                    self?.getArticles()
                }
            }
        }
    }
}
