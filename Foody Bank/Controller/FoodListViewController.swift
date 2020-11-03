//
//  FoodListViewController.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import UIKit

class FoodListViewController: UITableViewController, FoodManagerDelegate {

    var foodManager = FoodManager()
    
    var searchBarText: String = ""
    
    var dishArray2:[Results] = []
    
//    var test: String = ""
//    var array = ["Alex","Jenny"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set this View as delegate from FoodManager
        foodManager.delegate = self
        
        print("Text from searchBar: \(searchBarText)")
        
        // fetch data
        foodManager.fetchFood(query: searchBarText)
        
        tableView.rowHeight = 200
        tableView.separatorColor = .clear
        
    }
    
    
    //MARK: - Delegate Method from FoodManagerDelegate
    func didUpdateDish(_ foodManager: FoodManager, foodModel: FoodModel) {
        // get the array from foodModel
        dishArray2 = foodModel.dishArray
        
        print("dishArray2.count is: \(dishArray2.count)")
        
        // after get the dishArray2, go back to main thread to reload tableView
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishArray2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cast the cell to be customized FoodTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath) as! FoodTableViewCell
        
        // cell corner radius
        cell.layer.cornerRadius = 20
        
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.white.cgColor
        
        // get the image url from array
        cell.imageURL = dishArray2[indexPath.row].image
        
        cell.dishTitle = dishArray2[indexPath.row].title
        
        return cell
    }
    
    //MARK: - TableView Delegate Method
    // Click on 1 cell to go to url source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // get the sourceURL from array
        let dishSourceURL = dishArray2[indexPath.row].sourceUrl
        
        // go to the website of this url
        if let websiteUrl = URL(string: dishSourceURL){
            UIApplication.shared.open(websiteUrl)
        }
    }
}


