//
//  RestaurantClass.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-03.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit
import CoreLocation

class RestaurantClass: NSObject {
    
    var Name: String
    var Items: [ItemListClass]
    var distance: Double
    var lat: Double
    var long: Double

init(name: String?, items: [String], distance: Double, long: Double, lat: Double) {
    
        self.Name = name ?? ""
        self.Items = []
        self.distance = distance
        self.lat = lat
        self.long = long
    }
}
