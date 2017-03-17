//
//  ViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-03.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate{
    
    @IBOutlet weak var table: UITableView!
    
    //initialize the filtered array for search functionality
    var filteredArray: [RestaurantClass] = []
    
    
    //Initialize any variables to be used
    var selectedRow: Int = -1
    
    //Initialize coordinates for the GPS Feature
    var locManager: CLLocationManager!
    var currLocation: CLLocation!
    
    //Initialize an array containing all the restaurants
    var RestaurantArray:[RestaurantClass] = []
    
    //initialize all restaurants
    var Restaurant1 = RestaurantClass(name:"Starbucks", items: [],distance:10, long: -122.92881, lat: 49.277839)
    var Restaurant2 = RestaurantClass(name:"Pizza Hut", items: [] ,distance: 5, long: -122.91255, lat: 49.277676)
    var Restaurant3 = RestaurantClass(name:"Triple O's", items: [],distance: 8, long: -122.9155, lat: 49.27784)
    var Restaurant4 = RestaurantClass(name: "Donair Town", items: [], distance: 7, long: -122.012, lat:49.2686)
    var Restaurant5 = RestaurantClass(name: "Natures Garden", items: [], distance: 7, long: -122.91585649, lat:49.3)
    var Restaurant6 = RestaurantClass(name: "Poke Bar", items: [], distance: 7, long: -122.915757, lat:49.24747)
    var Restaurant7 = RestaurantClass(name: "Big Smoke Burgers", items: [], distance: 7, long: -122.912787, lat:49.2565)
    var Restaurant8 = RestaurantClass(name: "Bamboo Garden", items: [], distance: 7, long: -122.91246, lat:49.25857)
    var Restaurant9 = RestaurantClass(name: "Club Ilia", items: [], distance: 7, long: -122.9, lat:49.2)
    var Restaurant10 = RestaurantClass(name: "Bubble World", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant11 = RestaurantClass(name: "Gawon Korean", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant12 = RestaurantClass(name: "Guadalupe Handmade Burritos", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant13 = RestaurantClass(name: "Higher Grounds Coffee Shop", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant14 = RestaurantClass(name: "Highlands Pub", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant15 = RestaurantClass(name: "Ichibankan Express", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant16 = RestaurantClass(name: "Jugo Juice", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant17 = RestaurantClass(name: "Plum Garden Noodle House", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant18 = RestaurantClass(name: "Quesada Burritos and Tacos", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant19 = RestaurantClass(name: "Renaissance Coffee", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant20 = RestaurantClass(name: "Spicy Stone", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant21 = RestaurantClass(name: "Subway", items: [], distance: 7, long: -122.101, lat:49.2477)
    var Restaurant22 = RestaurantClass(name: "Tim Hortons", items: [], distance: 7, long: -122.101, lat:49.2477)

    /***************************************************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ArrayItems1 = parseCSV(name: "Starbucks")
        let ArrayItems2 = parseCSV(name: "PizzaHut")
        let ArrayItems3 = parseCSV(name: "TripleO's")
        let ArrayItems4 = parseCSV(name: "DonairTown")
        let ArrayItems5 = parseCSV(name: "NaturesGardenSFU")
        let ArrayItems6 = parseCSV(name: "PokeBar")
        let ArrayItems7 = parseCSV(name: "BigSmokeBurgers")
        let ArrayItems8 = parseCSV(name: "BambooGarden")
        let ArrayItems9 = parseCSV(name: "ClubIlia")
        let ArrayItems10 = parseCSV(name: "BubbleWorld")
        let ArrayItems11 = parseCSV(name: "GawonKorean")
        let ArrayItems12 = parseCSV(name: "GuadalupeHandmadeBurritos")
        let ArrayItems13 = parseCSV(name: "HigherGroundsCoffeeShop")
        let ArrayItems14 = parseCSV(name: "HighlandsPub")
        let ArrayItems15 = parseCSV(name: "IchibankanExpress")
        let ArrayItems16 = parseCSV(name: "JugoJuice")
        let ArrayItems17 = parseCSV(name: "PlumGardenNoodleHouse")
        let ArrayItems18 = parseCSV(name: "QuesadaBurritosAndTacos")
        let ArrayItems19 = parseCSV(name: "RenaissanceCoffee")
        let ArrayItems20 = parseCSV(name: "SpicyStone")
        let ArrayItems21 = parseCSV(name: "Subway")
        let ArrayItems22 = parseCSV(name: "TimHortons")
        
        //load arrays of items into the Restaurant objects
        Restaurant1.Items = ArrayItems1
        Restaurant2.Items = ArrayItems2
        Restaurant3.Items = ArrayItems3
        Restaurant4.Items = ArrayItems4
        Restaurant5.Items = ArrayItems5
        Restaurant6.Items = ArrayItems6
        Restaurant7.Items = ArrayItems7
        Restaurant8.Items = ArrayItems8
        Restaurant9.Items = ArrayItems9
        Restaurant10.Items = ArrayItems10
        Restaurant11.Items = ArrayItems11
        Restaurant12.Items = ArrayItems12
        Restaurant13.Items = ArrayItems13
        Restaurant14.Items = ArrayItems14
        Restaurant15.Items = ArrayItems15
        Restaurant16.Items = ArrayItems16
        Restaurant17.Items = ArrayItems17
        Restaurant18.Items = ArrayItems18
        Restaurant19.Items = ArrayItems19
        Restaurant20.Items = ArrayItems20
        Restaurant21.Items = ArrayItems21
        Restaurant22.Items = ArrayItems22
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
        RestaurantArray.insert(Restaurant11, at:10)
        RestaurantArray.insert(Restaurant12, at:11)
        RestaurantArray.insert(Restaurant13, at:12)
        RestaurantArray.insert(Restaurant14, at:13)
        RestaurantArray.insert(Restaurant15, at:14)
        RestaurantArray.insert(Restaurant16, at:15)
        RestaurantArray.insert(Restaurant17, at:16)
        RestaurantArray.insert(Restaurant18, at:17)
        RestaurantArray.insert(Restaurant19, at:18)
        RestaurantArray.insert(Restaurant20, at:19)
        RestaurantArray.insert(Restaurant21, at:20)
        RestaurantArray.insert(Restaurant22, at:21)
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
        if self.searchDisplayController.shouldShowSearchResults{
            return filteredArray.count
        }
        else{
            return RestaurantArray.count}
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
    
    /*************************************************************************************************/
    //  This function accepts the name of a CSV file as a parameter and returns the content as       //
    //                              an array of ItemListClass items                                  //
    /*************************************************************************************************/
    
    func parseCSV(name: String) -> Array<ItemListClass> {
        let path = Bundle.main.path(forResource: name, ofType: "csv")
        var RestaurantItems: [ItemListClass] = []
        do{
            
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            var index = 0
            
            for row in rows {
                
                // let iItemToAdd = ItemListClass()
                let sName = row["Item"]
                let dCalories = Double(row["Calories"]!)
                let dFats = Double(row["Fats"]!)
                let dProteins = Double(row["Protein"]!)
                let dCarbs = Double(row["Carbs"]!)
                let dSodium = Double(row["Sodium"]!)
                let sVegan = row["Vegan"]
                let sVegetarian = row["Vegetarian"]
                let sHasEggs = row["Egg"]
                let sHasPeanuts = row["Peanut"]
                let sHasMilk = row["Milk"]
                let sHasFish = row["Fish"]
                let sHasShellFish = row["ShellFish"]
                let sHasTreenut = row["Treenut"]
                let sHasWheat = row["Wheat"]
                let sHasSoy = row["Soy"]
                
                var bVegan = false
                var bVegetarian = false
                var bHasEggs = false
                var bHasPeanuts = false
                var bHasMilk = false
                var bHasFish = false
                var bHasShellFish = false
                var bHasTreenut = false
                var bHasWheat = false
                var bHasSoy = false
                
                if (sVegan == "Yes" || sVegan == "yes") {
                    bVegan = true
                }
                
                if (sVegetarian == "Yes" || sVegetarian == "yes") {
                    bVegetarian = true
                }
                
                if (sHasEggs == "Yes" || sHasEggs == "yes") {
                    bHasEggs = true
                }
                
                if (sHasPeanuts == "Yes" || sHasPeanuts == "yes") {
                    bHasPeanuts = true
                }
                
                if (sHasMilk == "Yes" || sHasMilk == "yes") {
                    bHasMilk = true
                }
                
                if (sHasShellFish == "Yes" || sHasShellFish == "yes") {
                    bHasShellFish = true
                }
                
                if (sHasTreenut == "Yes" || sHasTreenut == "yes") {
                    bHasTreenut = true
                }
                
                if (sHasWheat == "Yes" || sHasWheat == "yes") {
                    bHasWheat = true
                }
                
                if (sHasSoy == "Yes" || sHasSoy == "yes") {
                    bHasSoy = true
                }
                
                if (sHasFish == "Yes" || sHasFish == "yes") {
                    bHasFish = true
                }

                let iItemToAdd = ItemListClass(Name: sName!, Calories: dCalories!, Fats: dFats!, Carbs: dCarbs!, Protein: dProteins!, Sodium: dSodium!, Vegetarian: bVegetarian, Vegan: bVegan, Egg: bHasEggs, Milk:bHasMilk, Peanut: bHasPeanuts, TreeNut: bHasTreenut, Fish: bHasFish, ShellFish: bHasShellFish, Wheat: bHasWheat, Soy: bHasSoy)

                RestaurantItems.insert(iItemToAdd, at: index)
                index = index + 1
 
 
            }

            
        }
        catch{
            print ("Could not open file " + name)
        }
        
        return RestaurantItems
        
    }
    
    
    //****************** Search Bar Functions *************************
    
    
    

    
  
    
}
