//
//  ItemListClass.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-04.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class ItemListClass: NSObject {
    
    var Name: String = ""
    var Calories: Double = 0
    var Fats: Double = 0
    var Protein: Double = 0
    var Carbs: Double = 0
    var Sodium: Double = 0
    var Vegetarian: Bool = false
    var Vegan: Bool = false
    var Egg: Bool = false
    var Milk: Bool = false
    var Peanut: Bool = false
    var TreeNut: Bool = false
    var Fish: Bool = false
    var ShellFish: Bool = false
    var Wheat: Bool = false
    var Soy: Bool = false
    
    
    init(Name: String, Calories: Double, Fats: Double, Carbs: Double, Protein: Double, Sodium: Double, Vegetarian: Bool, Vegan: Bool, Egg: Bool, Milk:Bool, Peanut: Bool, TreeNut: Bool, Fish: Bool, ShellFish: Bool, Wheat: Bool, Soy:Bool){
        
        self.Name = Name
        self.Calories = Calories
        self.Fats = Fats
        self.Protein = Protein
        self.Carbs = Carbs
        self.Sodium = Sodium
        self.Vegetarian = Vegetarian
        self.Vegan = Vegan
        self.Egg = Egg
        self.Milk = Milk
        self.Peanut = Peanut
        self.TreeNut = TreeNut
        self.Fish = Fish
        self.ShellFish = ShellFish
        self.Wheat = Wheat
        self.Soy = Soy
        
    }
    
    override init() {
        self.Name = ""
        self.Calories = 0
        self.Fats = 0
        self.Protein = 0
        self.Carbs = 0
        self.Sodium = 0
        self.Vegetarian = false
        self.Vegan = false
        self.Egg = false
        self.Milk = false
        self.Peanut = false
        self.TreeNut = false
        self.Fish = false
        self.ShellFish = false
        self.Wheat = false
        self.Soy = false
    }

    

}
