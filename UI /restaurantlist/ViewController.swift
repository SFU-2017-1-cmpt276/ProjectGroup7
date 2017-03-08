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
    
    //Initialize any variables to be used
    var selectedRow: Int = -1
    
    //Initialize coordinates for the GPS Feature
    var locManager: CLLocationManager!
    var currLocation: CLLocation!
    
    //Initialize an array containing all the restaurants
    var RestaurantArray:[RestaurantClass] = []
    
    //**************************************************************************************************************
    
    // This is temporary code to be replaced by code that loads the data
    //This code was used to check the UI
    
    var Item1 = ItemListClass(Name: "Muffin", Calories: 350, Fats: 10, Carbs: 10, Protein: 10, Sodium: 300, Vegetarian: true, Vegan: false, Egg: false, Milk: false, Peanut: false, TreeNut: false, Fish: false, ShellFish: false, Wheat: false, Soy: false)
    
    var Item3 = ItemListClass(Name: "Croissant", Calories: 200, Fats: 10, Carbs: 10, Protein: 10, Sodium: 10, Vegetarian: false, Vegan: false, Egg: false, Milk: false, Peanut: false, TreeNut: false, Fish: false, ShellFish: false, Wheat: false, Soy: false)
    
    
    var Item2 = ItemListClass(Name: "Pizza", Calories: 200, Fats: 10, Carbs: 10, Protein: 10, Sodium: 10, Vegetarian: false, Vegan: false, Egg: false, Milk: false, Peanut: false, TreeNut: false, Fish: false, ShellFish: false, Wheat: false, Soy: false)
    
    //Initialize Array of Items to be inserted into the restaurant objects
    
    var ArrayItems1: [ItemListClass] = []
    var ArrayItems2: [ItemListClass] = []
    
    //**************************************************************************************************************/
    
    //initialize all restaurants
    
    var Restaurant1 = RestaurantClass(name:"Starbucks Cornerstone", items: [],distance:10, long: -122.92881, lat:49.277839)
    var Restaurant2 = RestaurantClass(name:"Pizza Hut", items: [] ,distance: 5, long: -122.91255, lat: 49.277676)
    var Restaurant3 = RestaurantClass(name:"Triple O's", items: [],distance: 8, long: -122.9155, lat: 49.27784)
    var Restaurant4 = RestaurantClass(name: "Donair Town", items: [], distance: 7, long: -122.012, lat:49.2686)
    var Restaurant5 = RestaurantClass(name: "Natures Garden", items: [], distance: 7, long: -122.91585649, lat:49.3)
    var Restaurant6 = RestaurantClass(name: "Poke Bar", items: [], distance: 7, long: -122.915757, lat:49.24747)
    var Restaurant7 = RestaurantClass(name: "Big Smoke Burgers", items: [], distance: 7, long: -122.912787, lat:49.2565)
    var Restaurant8 = RestaurantClass(name: "Bamboo Garden", items: [], distance: 7, long: -122.91246, lat:49.25857)
    var Restaurant9 = RestaurantClass(name: "Club Ilia", items: [], distance: 7, long: -122.9, lat:49.2)
    var Restaurant10 = RestaurantClass(name: "Bubble World", items: [], distance: 7, long: -122.101, lat:49.2477)

    // **************************************************************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load all items into seperate arrays according to which restaurant they belong to
        ArrayItems1.insert(Item1, at:0)
        ArrayItems1.insert(Item3, at:1)
        ArrayItems2.insert(Item2, at:0)
        
        //load arrays of items into the Restaurant objects
        Restaurant1.Items = ArrayItems1
        Restaurant2.Items = ArrayItems2
        
        //All restaurants are put in an array
        //*********************************************/
        RestaurantArray.insert(Restaurant1, at: 0)
        RestaurantArray.insert(Restaurant2, at: 1)
        RestaurantArray.insert(Restaurant3, at: 2)
        RestaurantArray.insert(Restaurant4, at:3)
        RestaurantArray.insert(Restaurant5, at:4)
        RestaurantArray.insert(Restaurant6, at:5)
        RestaurantArray.insert(Restaurant7, at:6)
        RestaurantArray.insert(Restaurant8, at:7)
        RestaurantArray.insert(Restaurant9, at:8)
        RestaurantArray.insert(Restaurant10, at:9)
        /*********************************************/
        
        //Get location
        
        locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        currLocation = locManager.location
        
        //Apply distance function to each restaurant function in array to find the distance from user
        
        for object in RestaurantArray{
            calculate_distance(restaurant: object)
        }
        
        //sort the array by distance
        RestaurantArray =  RestaurantArray.sorted(by: {$0.distance < $1.distance})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    //Distance Function
    
    func calculate_distance(restaurant: RestaurantClass){
        
        //initialize the user latitude and longitude (ignore warnings: keep it as "var" for now)
        var latitude = currLocation.coordinate.latitude
        var longitude = currLocation.coordinate.longitude
        
        //print user latitude and longitude for testing
        print("user latitude: ", latitude)
        print("user longitude:", longitude)
        
        let userLocation:CLLocation = CLLocation(latitude:latitude, longitude: longitude)
        let RestaurantLoc:CLLocation = CLLocation(latitude: restaurant.lat, longitude: restaurant.long)
        let meters:CLLocationDistance = RestaurantLoc.distance(from: userLocation)
        //the /1000 is temporary: device uses San Fran coordinates
        restaurant.distance = round(meters/1000)
    }
    //Functions necessary for tableView **************************************************************
    
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
    //************************************************************************************************
    
    //The following function passes an array of the class "itemListClass" to the ItemDetail viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ItemView: ItemViewController = segue.destination as! ItemViewController
        selectedRow = table.indexPathForSelectedRow!.row
        ItemView.data =  RestaurantArray[selectedRow].Items
    }
}
