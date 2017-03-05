//
//  ViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-03.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    //load data of items into the array
    
    var data:[String] = []
    
    var RestaurantNames:[RestaurantClass] = []
    
    //initialize all restaurants

    
    var Restaurant1 = RestaurantClass(name:"Starbucks", items: ["Muffins", "Coffee"],distance: 10)
    var Restaurant2 = RestaurantClass(name:"Pizza Hut", items: ["Pizza", "Bread"],distance: 5)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //data.append(Restaurant1.Name)
        //data.append(Restaurant2.Name)
        
        //calculate latitude and longitude (call back)
        
        
        //function to calculate distance
        

        
        RestaurantNames.append(Restaurant1)
        RestaurantNames.append(Restaurant2)
        
       RestaurantNames =  RestaurantNames.sorted(by: {$0.distance > $1.distance})
        
        //set up for loop to put names in an array to be loaded to the table
        
      for object in RestaurantNames{
            data.append(object.Name)
        }
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Items", sender: nil)
    }

}



