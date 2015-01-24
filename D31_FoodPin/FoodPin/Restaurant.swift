//
//  Restaurant.swift
//  FoodPin
//
//  Created by BillZong on 15-1-23.
//  Copyright (c) 2015年 BillZong. All rights reserved.
//

import Foundation

class  Restaurant {
    var  name: String  = ""
    var  type: String  = ""
    var  location: String  = ""
    var  image: String  = ""
    var  isVisited: Bool  = false
    init (name: String , type: String , location: String , image: String , isVisited: Bool ) {
        self.name  = name
        self.type  = type
        self.location  = location
        self.image  = image
        self.isVisited  = isVisited
    }
}