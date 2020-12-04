//
//  MostPopularArticlesViewController.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

class MostPopularArticlesViewController: BaseViewController {
    typealias ViewModel = MostPopularArticlesViewModelProtocol
    var viewModel: ViewModel! { _viewModel as? ViewModel}
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.backgroundView = self.activityIndicator
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.tableFooterView = UIView()
            self.tableView.register(ArticleTableViewCell.nib,
                                    forCellReuseIdentifier: ArticleTableViewCell.identifier)
        }
    }
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.nyTimesMostPopular
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true
        self.refreshControl.addTarget(self, action: #selector(self.getArticles),
                                      for: .valueChanged)
        self.tableView.refreshControl = self.refreshControl
        getArticles()
    }
    @objc func getArticles() {
        viewModel.getArticles()
    }
    func openArticle(at index: Int) {
        let article = viewModel.articles[index]
        let articleViewModel = ArticleViewModel(article: article)
        let articleViewController = ArticleViewController(viewModel: articleViewModel)
        self.navigationController?.pushViewController(articleViewController, animated: true)
    }
}

extension MostPopularArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView
            .dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier,
                                 for: indexPath) as? ArticleTableViewCell
            else { fatalError() }
        tableViewCell.configureCell(withArticle: viewModel.articles[indexPath.row])
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        openArticle(at: indexPath.row)
    }
}

extension MostPopularArticlesViewController: MostPopularArticlesViewControllerProtocol {
    func articlesLoaded() {
        self.activityIndicator.stopAnimating()
        self.refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
}
