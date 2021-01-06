//
//  TestModel.swift
//  Practical
//
//  Created by Dhruv Patel on 06/01/21.
//  Copyright © 2021 Dhruv Patel. All rights reserved.
//

import UIKit
import ObjectMapper

class TestModel: Mappable {
    
    required init(){}
    
    required init?(map: Map){
        self.mapping(map: map)
    }
    func mapping(map: Map){
    }
}

