//
//  recipe.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-04-02.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//
//coding standard:
//The names of variables and items should be self-descriptive
//if any changes are made to existing code in this file notify all programmers in the group chat
//Xcode bracket convention should be followed
//only when the updates you have made are compiling, may this projected be submitted to the master branch on github
//notify all programmers of any existing bugs in the compiling version of the project submitted on the github master branch



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
