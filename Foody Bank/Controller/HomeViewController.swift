//
//  ViewController.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var backgroundImageArray: [UIImage] = [
        UIImage(named:"homeScreenImage")!,
        UIImage(named:"food1.jpg")!,
        UIImage(named:"food2.jpg")!,
        UIImage(named:"food3.jpg")!,
        UIImage(named:"food4.jpg")!,
        UIImage(named:"food5.jpg")!,
        UIImage(named:"food6.jpg")!,
        UIImage(named:"food7.jpg")!,
        UIImage(named:"food8.jpg")!,
    ]
    
    var testString: String = ""

    var foodManager = FoodManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create a random number from 0 - 8
        let number = Int.random(in: 0..<9)
        
        // background will display random picture
        backgroundImage.image = backgroundImageArray[number]
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


