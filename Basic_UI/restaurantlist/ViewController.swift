//
//  ViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-03.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var table: UITableView!
    
    let locationManager = CLLocationManager()
    
    var selectedRow: Int = 0
    
   
    
    
    //load data of items into the array
    
    var coords:CLLocation? = nil
    //initialize the restaurant array
    var RestaurantArray:[RestaurantClass] = []
  
    //THIS IS WHERE DATA WILL BE LOADED!!!!!!!!!****************************************
    
   // Initialize Items belonging to restaurants
    
    
    var Item1 = ItemListClass(Name: "Muffin", Calories: 350, Fats: 10, Carbs: 10, Protein: 10, Sodium: 300, Vegetarian: true, Vegan: false, Egg: false, Milk: false, Peanut: false, TreeNut: false, Fish: false, ShellFish: false, Wheat: false, Soy: false)

    
    var Item2 = ItemListClass(Name: "Pizza", Calories: 200, Fats: 10, Carbs: 10, Protein: 10, Sodium: 10, Vegetarian: false, Vegan: false, Egg: false, Milk: false, Peanut: false, TreeNut: false, Fish: false, ShellFish: false, Wheat: false, Soy: false)
    
    //Initialize Array of Items
    
    var ArrayItems1: [ItemListClass] = []
    
    var ArrayItems2: [ItemListClass] = []
    
    
    
  
    
    

    //initialize all restaurants
    
    var Restaurant1 = RestaurantClass(name:"Starbucks", items: [],distance:10, long: 10, lat: 10)
    var Restaurant2 = RestaurantClass(name:"Pizza Hut", items: [] ,distance: 5, long: 10, lat: 10)
    
   // ***********************************************************************************
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ArrayItems1.insert(Item1, at:0)
        ArrayItems2.insert(Item2, at:0)
    
        Restaurant1.Items = ArrayItems1
        Restaurant2.Items = ArrayItems2
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //put all restaurants in a restaurant array
        
        //*********************************************
        RestaurantArray.insert(Restaurant1, at: 0)
        RestaurantArray.insert(Restaurant2, at: 1)
        //*********************************************
        
        //calculate latitude and longitude of user location (call back)
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
       // Apply distance function to each restaurant function in array
        
        for object in RestaurantArray{
            calculate_distance(restaurant: object)
            }
        
        
        //sort the array by distance
       RestaurantArray =  RestaurantArray.sorted(by: {$0.distance > $1.distance})
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let userLocation:CLLocation = locations[0] as! CLLocation
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        coords = userLocation
    }
    



    
    
    //function that implements function on every element in array
    
    func calculate_distance(restaurant: RestaurantClass){
        
    //var distance_lat = (coords?.coordinate.latitude)! - restaurant.lat
   // var distance_long = (coords?.coordinate.longitude)! - restaurant.long
        
        
        //do some trig
        restaurant.distance = 10

        }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RestaurantArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = RestaurantArray[indexPath.row].Name
        cell.detailTextLabel?.text = String(RestaurantArray[indexPath.row].distance) + "km away"
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Items", sender: Any?.self)
        selectedRow = indexPath.row
    }


    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ItemView: ItemViewController = segue.destination as! ItemViewController
        selectedRow = table.indexPathForSelectedRow!.row
        ItemView.setText(t: RestaurantArray[selectedRow].Items[0].Name)
    
    
    }
    

}
