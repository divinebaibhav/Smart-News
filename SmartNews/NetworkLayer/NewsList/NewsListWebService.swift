//
//  NewsListWebService.swift
//  SmartNews
//
//  Created by Baibhav singh on 08/09/22.
//

import Foundation

class NewsListWebService {
    
    
    func getArticleList(url: URL, onComplition: @escaping ([Article]?)->() )  {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                onComplition(nil)
                
            } else if let data = data {
                print(data)
                do {
                    /*
                     //NOTE: put try! to see logs, for whcih key specifi c is nil

                     e.g.
                     SmartNews/NewsListWebService.swift:23: Fatal error: 'try!' expression unexpectedly raised an error: Swift.DecodingError.keyNotFound(CodingKeys(stringValue: "totalResult", intValue: nil), Swift.DecodingError.Context(codingPath: [], debugDescription: "No value associated with key CodingKeys(stringValue: \"totalResult\", intValue: nil) (\"totalResult\").", underlyingError: nil))
                     */
                    
                    let articleList  = try? JSONDecoder().decode(ArticleList.self, from: data)
                    //print(articleList)
                    
                    if let articleList = articleList {
                        onComplition(articleList.articles)
                    }
                    
                } catch let exception {
                    print(exception.localizedDescription)
                }
            }
                
        }.resume()
    }
    
    
    
    
   
}

