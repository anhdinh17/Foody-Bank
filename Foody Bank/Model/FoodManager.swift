//
//  FoodManager.swift
//  Foody Bank
//
//  Created by Anh Dinh on 9/1/20.
//  Copyright © 2020 Anh Dinh. All rights reserved.
//

import Foundation

protocol FoodManagerDelegate{
    func didUpdateDish(_ foodManager: FoodManager, foodModel: FoodModel)
}

struct FoodManager {
    
    var delegate: FoodManagerDelegate?
    
    let foodURL = "https://api.spoonacular.com/recipes/complexSearch?&apiKey=67cad3b80c5d4a579bc26754307767c6&addRecipeInformation=true"
    
    func fetchFood(query: String){
        let urlString = "\(foodURL)&query=\(query)"
        performRequest(with: urlString)
    }
    
    //MARK: - Networking
    func performRequest(with urlString: String){
        // 1. Create URL
        if let url = URL(string: urlString){
            
            //2. Create URLSession
            let session = URLSession(configuration: .default)
            
            //3.Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print("Error networking: \(error)")
                    return
                }
                
                if let safeData = data{ // this data is data from server
                    if let food = self.parseJSON(foodData: safeData){
                        // whichever ViewController set itself as delegate, it executes the func didUpdateDish with parameter is FoodModel
                        self.delegate?.didUpdateDish(self, foodModel: food)
                    }
                    
                }
                
            }
            
            //4.Start the task
            task.resume()
        }
    }
    
    // decode data from raw data from server
    // the return of this func is an array of 10 Results objects
    func parseJSON(foodData: Data)->FoodModel?{
        let decoder = JSONDecoder()
        
        do{
            // decodedData is an instance of FoodData Class
            let decodedData = try decoder.decode(FoodData.self, from: foodData)

            
            // dishArray is an array of Results struct
            let dishArray = decodedData.results
            
            let food = FoodModel(dishArray: dishArray)
                        
            return food // food is now having 10 Results objects
        }catch{
            print("Error decoding: \(error)")
            return nil
        }
        
    }
    
    
}
