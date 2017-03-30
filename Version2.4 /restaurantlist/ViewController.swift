//
//  ViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-03.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

//coding standard:
//The names of variables and items should be self-descriptive
//if any changes are made to existing code in this file notify all programmers in the group chat
//Xcode bracket convention should be followed
//only when the updates you have made are compiling, may this projected be submitted to the master branch on github
//notify all programmers of any existing bugs in the compiling version of the project submitted on the github master branch

//File description:
//This file is the viewController for the title page

//Known bugs:
//The GPS feature does not reload every few seconds, this still needs to be implemented
//an error may occur of the user is moving very fast and the app is loading with the distance function as the user location may be changing rapidly: this needs to be tested


import UIKit
import CoreLocation

class ViewController: UITableViewController,CLLocationManagerDelegate
{
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var allItems: UIBarButtonItem!
    var nilLocationFlag = 1
 
    
   // var resultSearchController = UISearchController()
    //initialize the filtered array for search functionality
    var filtered = [RestaurantClass]()
    let searchController = UISearchController(searchResultsController: nil)
    
    //Initialize any variables to be used
    var selectedRow: Int = -1
    
    //Initialize coordinates for the GPS Feature
    var locManager = CLLocationManager()

    
    //Initialize an array containing all the restaurants
    var RestaurantArray = [RestaurantClass]()
    var ArrayItems = [ItemListClass]()

    
    //initialize all restaurants
    var Restaurant1 = RestaurantClass(name:"Starbucks", items: [],distance:10, long: -122.912288, lat: 49.278124)
    var Restaurant2 = RestaurantClass(name:"Pizza Hut", items: [] ,distance: 5, long: -122.911990, lat: 49.277840)
    var Restaurant3 = RestaurantClass(name:"Triple O's", items: [],distance: 8, long:-122.917134 , lat: 49.279274)
    var Restaurant4 = RestaurantClass(name: "Donair Town", items: [], distance: 7, long: -122.911918, lat:49.277824)
    var Restaurant5 = RestaurantClass(name: "Natures Garden", items: [], distance: 7, long: -122.911474, lat: 49.278010)
    var Restaurant6 = RestaurantClass(name: "Poke Bar", items: [], distance: 7, long: -122.911852, lat:49.277800)
    var Restaurant7 = RestaurantClass(name: "Big Smoke Burgers", items: [], distance: 7, long: -122.912363, lat:49.277860)
    var Restaurant8 = RestaurantClass(name: "Bamboo Garden", items: [], distance: 7, long: -122.912079, lat:49.277837)
    var Restaurant9 = RestaurantClass(name: "Club Ilia", items: [], distance: 7, long: -122.912339, lat:49.277984)
    var Restaurant10 = RestaurantClass(name: "Bubble World", items: [], distance: 7, long: -122.919092, lat: 49.278656)
    var Restaurant11 = RestaurantClass(name: "Gawon Korean", items: [], distance: 7, long: -122.918849, lat: 49.278578)
    var Restaurant12 = RestaurantClass(name: "Guadalupe Handmade Burritos", items: [], distance: 7, long: -122.918729, lat:49.278599)
    var Restaurant13 = RestaurantClass(name: "Higher Grounds Coffee Shop", items: [], distance: 7, long: -122.918657, lat:49.278884)
    var Restaurant14 = RestaurantClass(name: "Highlands Pub", items: [], distance: 7, long: -122.919000, lat: 49.278621)
    var Restaurant15 = RestaurantClass(name: "Ichibankan Express", items: [], distance: 7, long: -122.912068, lat: 49.278108)
    var Restaurant16 = RestaurantClass(name: "Jugo Juice", items: [], distance: 7, long: -122.915743, lat: 49.279405)
    var Restaurant17 = RestaurantClass(name: "Plum Garden Noodle House", items: [], distance: 7, long: -122.911691, lat: 49.277800)
    var Restaurant18 = RestaurantClass(name: "Quesada Burritos and Tacos", items: [], distance: 7, long: -122.911580, lat: 49.277777)
    var Restaurant19 = RestaurantClass(name: "Renaissance Coffee", items: [], distance: 7, long: -122.914489, lat: 49.277812)
    var Restaurant20 = RestaurantClass(name: "Spicy Stone", items: [], distance: 7, long: -122.912032, lat:49.277840)
    var Restaurant21 = RestaurantClass(name: "Subway", items: [], distance: 7, long: -122.911892, lat: 49.278059)
    var Restaurant22 = RestaurantClass(name: "Tim Hortons", items: [], distance: 7, long: -122.921661, lat: 49.280142)
    
    /***************************************************************************************************/
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       //var button = self.navigationItem.leftBarButtonItem
      // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = allItems
        
       /* let button = UIBarButtonItem()
        self.navigationItem.rightBarButtonItem = button*/
        
        //*********Navigation Button************//
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        // Setup the Scope Bar
        //searchController.searchBar.scopeButtonTitles = ["Restaurant", "Food Items"]
        tableView.tableHeaderView = searchController.searchBar
        
        
        //set up the GPS feature
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startMonitoringSignificantLocationChanges()
        locManager.startUpdatingLocation()
    
        
        let ArrayItems1 = parseCSV(name: "Starbucks")
        for object in ArrayItems1 {
            object.Restuarant = "Starbucks"
        }
        
        let ArrayItems2 = parseCSV(name: "PizzaHut")
        for object in ArrayItems2 {
            object.Restuarant = "PizzaHut"
        }
        
        
        let ArrayItems3 = parseCSV(name: "TripleO's")
        for object in ArrayItems3 {
            object.Restuarant = "TripleO's"
        }
        let ArrayItems4 = parseCSV(name: "DonairTown")
        for object in ArrayItems4 {
            object.Restuarant = "DonairTown"
        }
        let ArrayItems5 = parseCSV(name: "NaturesGardenSFU")
        for object in ArrayItems5 {
            object.Restuarant = "NaturesGardenSFU"
        }
        let ArrayItems6 = parseCSV(name: "PokeBar")
        for object in ArrayItems6 {
            object.Restuarant = "PokeBar"
        }
        let ArrayItems7 = parseCSV(name: "BigSmokeBurgers")
        for object in ArrayItems7{
            object.Restuarant = "BigSmokeBurgers"
        }
        let ArrayItems8 = parseCSV(name: "BambooGarden")
        for object in ArrayItems8 {
            object.Restuarant = "BambooGarden"
        }
        let ArrayItems9 = parseCSV(name: "ClubIlia")
        for object in ArrayItems9{
            object.Restuarant = "ClubIlia"
        }
        let ArrayItems10 = parseCSV(name: "BubbleWorld")
        for object in ArrayItems10 {
            object.Restuarant = "BubbleWorld"
        }
        let ArrayItems11 = parseCSV(name: "GawonKorean")
        for object in ArrayItems11 {
            object.Restuarant = "GawonKorean"
        }
        let ArrayItems12 = parseCSV(name: "GuadalupeHandmadeBurritos")
        for object in ArrayItems12 {
            object.Restuarant = "GuadalupeHandmadeBurritos"
        }
        let ArrayItems13 = parseCSV(name: "HigherGroundsCoffeeShop")
        for object in ArrayItems13 {
            object.Restuarant = "HigherGroundsCoffee"
        }
        let ArrayItems14 = parseCSV(name: "HighlandsPub")
        for object in ArrayItems14 {
            object.Restuarant = "HighlandsPub"
        }
        let ArrayItems15 = parseCSV(name: "IchibankanExpress")
        for object in ArrayItems15{
            object.Restuarant = "IchibankanExpress"
        }
        let ArrayItems16 = parseCSV(name: "JugoJuice")
        for object in ArrayItems16 {
            object.Restuarant = "JugoJuice"
        }
        let ArrayItems17 = parseCSV(name: "PlumGardenNoodleHouse")
        for object in ArrayItems17 {
            object.Restuarant = "PlumGardenNoodleHouse"
        }
        let ArrayItems18 = parseCSV(name: "QuesadaBurritosAndTacos")
        for object in ArrayItems18 {
            object.Restuarant = "QuesadaBurritosAndTacos"
        }
        
        let ArrayItems19 = parseCSV(name: "RenaissanceCoffee")
        for object in ArrayItems19 {
            object.Restuarant = "RenaissanceCoffee"
        }
        
        let ArrayItems20 = parseCSV(name: "SpicyStone")
        for object in ArrayItems20 {
            object.Restuarant = "SpicyStone"
        }
        let ArrayItems21 = parseCSV(name: "Subway")
        for object in ArrayItems21 {
            object.Restuarant = "Subway"
        }
        let ArrayItems22 = parseCSV(name: "TimHortons")
        for object in ArrayItems22 {
            object.Restuarant = "TimHortons"
        }
        
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
        
        //load items into an array
        
        ArrayItems = ArrayItems1
        ArrayItems = ArrayItems2 + ArrayItems
        ArrayItems = ArrayItems3 + ArrayItems
        ArrayItems = ArrayItems4 + ArrayItems
        ArrayItems = ArrayItems5 + ArrayItems
        ArrayItems = ArrayItems6 + ArrayItems
        ArrayItems = ArrayItems7 + ArrayItems
        ArrayItems = ArrayItems8 + ArrayItems
        ArrayItems = ArrayItems9 + ArrayItems
        ArrayItems = ArrayItems10 + ArrayItems
        ArrayItems = ArrayItems11 + ArrayItems
        ArrayItems = ArrayItems12 + ArrayItems
        ArrayItems = ArrayItems13 + ArrayItems
        ArrayItems = ArrayItems14 + ArrayItems
        ArrayItems = ArrayItems15 + ArrayItems
        ArrayItems = ArrayItems16 + ArrayItems
        ArrayItems = ArrayItems17 + ArrayItems
        ArrayItems = ArrayItems18 + ArrayItems
        ArrayItems = ArrayItems19 + ArrayItems
        ArrayItems = ArrayItems20 + ArrayItems
        ArrayItems = ArrayItems21 + ArrayItems
        ArrayItems = ArrayItems22 + ArrayItems
    

        
        //Apply distance function to each restaurant function in array to find the distance from user
        
        for object in RestaurantArray{
            calculate_distance(restaurant: object)
        }
        
        //sort the array by distance
        RestaurantArray =  RestaurantArray.sorted(by: {$0.distance < $1.distance})
        
        self.table.reloadData()
      
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    //Distance Function
    
    func calculate_distance(restaurant: RestaurantClass){
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse){
        
            //initialize the user latitude and longitude (ignore warnings: keep it as "var" for now)
            
            
            func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {}
            let location: CLLocation! = locManager.location
            
            if location != nil{
            
              let latitude = location.coordinate.latitude
              let longitude = location.coordinate.longitude
                
               // let latitude = 49
                //let longitude = 50
                nilLocationFlag = 0
    
            //print user latitude and longitude for testing
                print("user latitude: ", latitude)
                print("user longitude:", longitude)
            
            
                let userLocation:CLLocation = CLLocation(latitude:CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
                let RestaurantLoc:CLLocation = CLLocation(latitude: restaurant.lat, longitude: restaurant.long)
                let meters:CLLocationDistance = RestaurantLoc.distance(from: userLocation)
            
                //the /1000 is temporary: device uses San Fran coordinates
                restaurant.distance = round(meters)
                table.reloadData()
            }
        }
    }
    //Functions necessary for tableView**************************************************************
    
    //This function returns the number of rows in the tableview. It also takes into account the activity of the search bar
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if searchController.isActive && searchController.searchBar.text != "" {
            return self.filtered.count
            
        }

        return RestaurantArray.count
    }
    
    //This function is responsible for the tableView ouptut in the cells. It also takes into account a filtered array for the search bar and returns the "reusable cell"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell?
         let rest: RestaurantClass
        if searchController.isActive && searchController.searchBar.text != "" {
           
            rest = filtered[indexPath.row]
        }
        else {
            rest = RestaurantArray[indexPath.row]
        }
        cell?.textLabel?.text = rest.Name
        if nilLocationFlag == 0{
        cell?.detailTextLabel?.text = String(rest.distance) + "m away"
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // self.performSegue(withIdentifier: "Items", sender: Any?.self)
    }
    
    
    
    //************************************************************************************************
    
    //The following function passes an array of the class "itemListClass" to the ItemDetail viewcontroller to be used when a cell is selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "totalItems"{
            
            let controller = segue.destination as! ItemSearchViewController
            
            controller.data =  ArrayItems
            print("hi")
        }
        
        
        if(segue.identifier != "totalItems" && segue.identifier != "home"){
           let ItemView: ItemViewController = segue.destination as! ItemViewController
        
           selectedRow = table.indexPathForSelectedRow!.row
        
            if searchController.isActive && searchController.searchBar.text != "" {
                ItemView.data = filtered[selectedRow].Items
            }
        
            else{
                ItemView.data =  RestaurantArray[selectedRow].Items
            }
        }
     
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

                let iItemToAdd = ItemListClass(Name: sName!, Calories: dCalories!, Fats: dFats!, Carbs: dCarbs!, Protein: dProteins!, Sodium: dSodium!, Vegetarian: bVegetarian, Vegan: bVegan, Egg: bHasEggs, Milk:bHasMilk, Peanut: bHasPeanuts, TreeNut: bHasTreenut, Fish: bHasFish, ShellFish: bHasShellFish, Wheat: bHasWheat, Soy: bHasSoy, Restaurant: "")

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
    //This function filters the array of restaurants depending on the user input into the search bar, and reloads the tableView
    
    
    func goToSegue() {
        self.performSegue(withIdentifier: "totalItems", sender: self)
    }
    


func filterContentForSearchText(_ searchText: String) {
    filtered = RestaurantArray.filter({( restaurant : RestaurantClass) -> Bool in
        return restaurant.Name.lowercased().contains(searchText.lowercased())
    })
    tableView.reloadData()
    }

}

extension ViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        //let searchBar = searchController.searchBar
        
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

















