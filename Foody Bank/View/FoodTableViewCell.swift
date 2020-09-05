//
//  FoodTableViewCell.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/4/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodTitle: UILabel!
    // when imageURL gets value, it triggers setImage() to networking the image from the link
    var imageURL: String! {
        didSet{
            setImage(from: imageURL)
        }
    }
    
    var dishTitle: String! {
        didSet{
            foodTitle.text = dishTitle
        }
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            
            // set image for the cell
            DispatchQueue.main.async {
                self.foodImage.image = image
            }
        }
    }
    
    
    
}
