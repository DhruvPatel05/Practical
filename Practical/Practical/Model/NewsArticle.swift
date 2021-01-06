//
//  NewsArticle.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsArticle : TestModel {
    var source : NewsSource?
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
    
    
    required init(){
        super.init()
    }
    required init?(map: Map){
        super.init(map: map)
    }
    override func mapping(map: Map) {
        super.mapping(map: map)
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
    
}
