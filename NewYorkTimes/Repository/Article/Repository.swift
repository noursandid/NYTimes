//
//  MainController.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

class Repository {
    public static let current: Repository = Repository()
    func getMostViewedArticles(period: Period, completion: ((Result<[Article], Error>) -> Void)?) {
        APIRequest<Article>()
            .withURL(APISettings.getNewYorkTimesURL(forPeriod: period.rawValue))
            .withMethod("GET")
            .requestArray { (response) in
            if response.isOK, let articles = response.results {
                completion?(.success(articles))
            } else {
                completion?(.failure(NYError.somethingWentWrong))
            }
        }
    }
}
