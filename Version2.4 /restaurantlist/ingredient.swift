//
//  ingredient.swift
//  Part2
//
//  Created by Grazietta Hof on 2017-03-29.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class ingredient: NSObject {
    
    
    var Name: String = ""
    var recipeID: Double = 0
    
    
    init(Name: String, recipeID: Double){
        
        self.Name = Name
        self.recipeID = recipeID
    }
    
    override init() {
        self.Name = ""
        self.recipeID = 0
    }
    
}
