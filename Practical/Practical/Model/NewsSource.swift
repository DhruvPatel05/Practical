//
//  NewsSource.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//
import Foundation
import ObjectMapper

class NewsSource : TestModel {
    var id : String?
    var name : String?
    
    required init(){
        super.init()
    }
    required init?(map: Map){
        super.init(map: map)
    }
    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        name <- map["name"]
    }
    
}
