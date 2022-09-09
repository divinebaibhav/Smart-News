//
//  NewsListViewController.swift
//  SmartNews
//
//  Created by Baibhav singh on 06/09/22.
//

import Foundation
import UIKit

class NewsListViewController: UIViewController {
    
    private var articleList: ArticleListViewModel!
    let cellIndentifier = "ArticleListTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        callAPI()
    }
    
    private func setUp()  {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
   
}

extension NewsListViewController {
    
    private func callAPI() {
        
        NewsListWebService().getArticleList(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=951b58bcec2848c78d4153dba6393198")!) { list in
            if let articles = list {
                self.articleList = ArticleListViewModel.init(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
   
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleList == nil ? 0 : self.articleList.numberOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ArticleListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier) as! ArticleListTableViewCell
        let article = self.articleList.articleAtIndex(index: indexPath.row)
        cell.lblTitle.text = article.title
        cell.lblTitle.numberOfLines = 0

        cell.lblDescription.text = article.description
        cell.lblDescription.numberOfLines = 0
        return cell

    }
}
