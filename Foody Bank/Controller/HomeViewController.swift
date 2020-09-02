//
//  ViewController.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // empty array of Results struct
    var dishArray: [Results] = [] 
    
    var foodManager = FoodManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodManager.delegate = self
        
    }
    
    
}

//MARK: - UISearchBar
extension HomeViewController: UISearchBarDelegate {
    // what happens when clicking on search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
        foodManager.fetchFood(query: searchBar.text!)
        
        performSegue(withIdentifier: "foodList", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! FoodListViewController
        
        destinationVC.dishArray2 = dishArray
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            // whenever we affect UI/UX, use dispatchqueue
            DispatchQueue.main.async {
                searchBar.resignFirstResponder() // shut down the keyboard and cursor
            }
            
        }
    }
    
}

extension HomeViewController: FoodManagerDelegate {
    func didUpdateDish(_ foodManager: FoodManager, foodModel: FoodModel) {
        dishArray = foodModel.dishArray
    }
}
