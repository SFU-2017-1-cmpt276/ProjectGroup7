//
//  recipe.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-04-02.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class recipe: NSObject {
    
    
    var Name: String = ""
    var ID: Double = 0
    var Count: Double = 0
    var accuracy: Double = 0
    
    
    init(Name: String, ID: Double,Count: Double, accuracy: Double ){
        
        self.Name = Name
        self.ID = ID
        self.Count = Count
        self.accuracy = accuracy
        
    }
    
    override init() {
        self.Name = ""
        self.ID = 0
        self.Count = 0
        self.accuracy = 0
        
        
        
    }
    
}
