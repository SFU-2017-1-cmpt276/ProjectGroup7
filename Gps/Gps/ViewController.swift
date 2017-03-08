//
//  ViewController.swift
//  Gps
//
//  Created by Nicole Thomas on 2017-03-03.
//  Copyright © 2017 Nicole Thomas. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    var names:[String]!
    var descriptions:[String]!
    //var coordinates:[Any]!
    var currentRestaurantIndex: Int = 0
    var locationManager: CLLocationManager!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func showNext(_ sender: Any) {
        // 1
        if currentRestaurantIndex > names.count - 1{
            currentRestaurantIndex = 0
        }
        // 2
        let coordinate = coordinates[currentRestaurantIndex] as! [Double]
        let latitude: Double   = coordinate[0]
        let longitude: Double  = coordinate[1]
        let locationCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        var point = RestaurantAnnotation(coordinate: locationCoordinates)
        point.title = names[currentRestaurantIndex]
        
        let request = MKDirectionsRequest()
       
        let sourceItem = MKMapItem(placemark: MKPlacemark(coordinate: mapView.userLocation.coordinate, addressDictionary: nil))
        request.source = sourceItem
        
        let destinationItem = MKMapItem(placemark: MKPlacemark(coordinate: locationCoordinates, addressDictionary: nil))
        request.destination = destinationItem
        request.requestsAlternateRoutes = false
        request.transportType = .transit
        mapView.setCenter(locationCoordinates, animated: true)
        let directions = MKDirections(request: request)
        directions.calculateETA { (etaResponse, error) -> Void in
            if let error = error {
                print("Error while requesting ETA : \(error.localizedDescription)")
                point.eta = error.localizedDescription
            }else{
                point.eta = "\(Int((etaResponse?.expectedTravelTime)!/60)) min"
            }
            // 4
            var isExist = false
            for annotation in self.mapView.annotations{
                if annotation.coordinate.longitude == point.coordinate.longitude && annotation.coordinate.latitude == point.coordinate.latitude{
                    isExist = true
                    point = annotation as! RestaurantAnnotation
                }
            }
            if !isExist{
                self.mapView.addAnnotation(point)
            }
            self.mapView.selectAnnotation(point, animated: true)
            self.currentRestaurantIndex += 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Restaurants
        names = ["Bamboo Garden", "Big Smoke Burger", "Bubble World", "Club Ilia", "Donair Town", "Gawon Korean", "Guadalupe Handmade Burritos", "Higher Grounds Coffee Shop", "Highland Pub", "Ichibankan Express SFU", "Nature Garden", "Nester's Market", "Pizza Hut", "Plum GAden Noodle House", "Poke Bar", "Quesada Burritos and Tacos", "Renaisance Coffee", "Spicy STone", "Starbucks Cornerstone", "Starbucks Westmall", "Subyway COrnerStone", "Subway Mackenzie CAfe", "Tim Hortons", "Triple O's", "Jugo Juice", "Mackenzie Cafe" ]
        
        
        // Latitudes, Longitudes coordinates of each restaurant  
        coordinates = [[49.277839, -122.912081],
            [49.277867, -122.912372],
            [49.278819, -122.919041],
            [49.277986, -122.912335],
            [49.277827, -122.911922],
            [49.278578, -122.918853],
            [49.278602, -122.918732],
            [49.278887, -122.918655],
            [49.278618, -122.919001],
            [49.27811, -122.912069],
            [49.278012, -122.911477],
            [49.277797, -122.910073],
            [49.277842, -122.911995],
            [49.277913, -122.911802],
            [49.2778, -122.911854],
            [49.277778, -122.911582],
            [49.279397, -122.915624],
            [49.277829, -122.912029],
            [49.278124, -122.91228],
            [49.2796, -122.920961],
            [49.278061, -122.911894],
            [49.278868, -122.915608],
            [49.280247, -122.922318],
            [49.279311, -122.91712],
            [49.279412, -122.915741],
            [49.278868, -122.915608]
            
        ]
        
        currentRestaurantIndex = 0 // Start with the first Restaurant in the array
        // Ask for user permission to access location infos
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        // Show the user current location
        mapView.showsUserLocation = true
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: MKMapViewDelegate
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: self.mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        mapView.setRegion(region, animated: true)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is RestaurantAnnotation){
            return nil
        }
        
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }
        
        let restaurantAnnotation = annotation as! RestaurantAnnotation
        
        // Restaurant ETA
        let leftAccessory = UILabel(frame: CGRect(x: 0,y: 0,width: 50,height: 30))
        leftAccessory.text = restaurantAnnotation.eta
        leftAccessory.font = UIFont(name: "Verdana", size: 10)
        annotationView?.leftCalloutAccessoryView = leftAccessory
        return annotationView
        
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let placemark = MKPlacemark(coordinate: view.annotation!.coordinate, addressDictionary: nil)
        // The map item is the restaurant location
        let mapItem = MKMapItem(placemark: placemark)
        
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeTransit]
        mapItem.openInMaps(launchOptions: launchOptions)
    }
}
