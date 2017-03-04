//
//  RestaurantClass.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-03.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class RestaurantClass: NSObject {
    

    var Name: String
    var Items: [String]
    var distance: Int

    

    
    init(name: String?, items: [String], distance: Int) {
        self.Name = name ?? ""
        self.Items = []
        self.distance = distance
        
    }
    
    
}
