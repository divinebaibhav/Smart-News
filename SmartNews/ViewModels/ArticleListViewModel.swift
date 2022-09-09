//
//  ArticleListViewModel.swift
//  SmartNews
//
//  Created by Baibhav singh on 09/09/22.
//

import Foundation

//Article List
struct ArticleListViewModel {
    
     let articles: [Article]
    
}

extension ArticleListViewModel {
    
    //Computed Properties, always var
    var numberOfSection: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return self.articles.count
    }
    
    
    func articleAtIndex(index: Int) -> ArticleViewModel {
        let article =  self.articles[index]
        return  ArticleViewModel(article)
    }
    
    
}


// Each Article
struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.newsDescription
    }
}
