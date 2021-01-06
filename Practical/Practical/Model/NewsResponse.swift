//
//  NewsResponse.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//


import Foundation
import ObjectMapper

class NewsResponse : TestModel {
    var status : String?
    var totalResults : Int?
    var articles : [NewsArticle]?
    
    required init(){
        super.init()
    }
    required init?(map: Map){
        super.init(map: map)
    }
    override func mapping(map: Map) {
        super.mapping(map: map)
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
    
}
