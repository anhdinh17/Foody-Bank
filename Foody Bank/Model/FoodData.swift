//
//  FoodData.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import Foundation

struct FoodData: Codable{
    var results: [Results]
}

struct Results: Codable {
    var title: String
    var image: String
    var sourceUrl: String
}
