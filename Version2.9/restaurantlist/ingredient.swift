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
    var ID: Double = 0
    
    
    init(Name: String, ID: Double){
        
        self.Name = Name
        self.ID = ID
        
    }
    
    override init() {
        self.Name = ""
        self.ID = 0
        
    }
    
}
