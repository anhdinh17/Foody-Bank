//
//  ViewController.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    var testString: String = ""

    var foodManager = FoodManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

//MARK: - UISearchBar
extension HomeViewController: UISearchBarDelegate {
    // what happens when clicking on search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
        
        testString = searchBar.text!
        
        performSegue(withIdentifier: "foodList", sender: self)
        
    }
    
    // Prepare Segue to make 2nd View receive the text from searchBar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodList"{
            let destinationVC = segue.destination as! FoodListViewController
            destinationVC.searchBarText = testString
        }

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


