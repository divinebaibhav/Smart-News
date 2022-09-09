//
//  Article.swift
//  SmartNews
//
//  Created by Baibhav singh on 08/09/22.
//

import Foundation

struct ArticleList: Decodable {

    let status: String
    let totalResult: Int?
    let articles: [Article]
    
}

/*
 NOTE:
 Some values might come null from API.
 It solution can be:
 1. JSONDecoder maps NSNull to nil so the decoder throws an error if it's going to decode a nil value to a non-optional type.
 
  For null values in json :
     - The solution is to declare all affected properties as optional.
     - or customize the decoder to replace nil with an empty string.
  2. As implemented in example . make custum init
 
 
 
 */
struct Article: Decodable {
    
    let title: String
    let newsDescription: String
    let publishedAt: String
    let urlToImage: String
    let source: Source
    
    enum CodingKeys: String, CodingKey {
        case title
        case newsDescription = "description"
        case publishedAt
        case urlToImage
        case source
    }
    
    // The Initializer function from Decodable
    init(from decoder: Decoder) throws {
        
        // 1 - Container
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decodeIfPresent(String.self, forKey: KeyedDecodingContainer<CodingKeys>.Key.title) ?? "N/A"

        publishedAt = try values.decodeIfPresent(String.self, forKey: KeyedDecodingContainer<CodingKeys>.Key.publishedAt) ?? "N/A"
        urlToImage = try values.decodeIfPresent(String.self, forKey: KeyedDecodingContainer<CodingKeys>.Key.urlToImage) ?? "N/A"

        source = try values.decodeIfPresent(Source.self, forKey: KeyedDecodingContainer<CodingKeys>.Key.source) ?? Source(name: "N/A")

        newsDescription = try values.decodeIfPresent(String.self, forKey: KeyedDecodingContainer<CodingKeys>.Key.newsDescription) ?? "N/A"
        
    }
}

struct Source: Decodable {
    let name: String
}



//    // The encoding function from Encodable; To handle Values
//    func encode(to encoder: Encoder) throws {
//
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(firstName, forKey: .firstName)
//        try container.encode(lastName, forKey: .lastName)
//
//        if self.email == "N/A" {
//            try container.encode("", forKey: .email)
//        }else {
//            try container.encodeIfPresent(email, forKey: .email)
//        }
//        try container.encode(id, forKey: .id)
//
//    }
