//
//  MostPopularArticlesViewModelProtocol.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import Foundation

protocol MostPopularArticlesViewModelProtocol: class {
    var articles: [Article] { get set }
    func getArticles()
}
