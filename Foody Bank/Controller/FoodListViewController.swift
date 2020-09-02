//
//  FoodListViewController.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import UIKit

class FoodListViewController: UITableViewController {
    
    var dishArray2: [Results] = []{
        didSet{
            print("dishArray.count: \(dishArray2.count)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishArray2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath)
        
        cell.textLabel?.text = dishArray2[indexPath.row].title
        
        return cell
    }
    
}
