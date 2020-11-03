//
//  FoodData.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import Foundation

// FoodData is the structure of how we want to store data from server

struct FoodData: Codable{
    var results: [Results]
}

struct Results: Codable {
    var title: String
    var image: String
    var sourceUrl: String
}
