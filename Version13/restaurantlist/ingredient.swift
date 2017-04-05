/*

  ingredient.swift
  Part 2

  Created by Grazietta Hof on 2017-03-29.
  Copyright © 2017 Grazietta Hof. All rights reserved.

  PROGRAMMERS: Fran, Grazietta, Nicole, Jordan

  CODING STANDARD:
  * The names of variables and items should be self-descriptive
  * If any changes are made to existing code in this file notify all programmers in the group chat
  * Xcode bracket convention should be followed
  * Only when the updates you have made are compiling, may this projected be submitted to the master branch on github
  * Notify all programmers of any existing bugs in the compiling version of the project submitted on the github master branch

*/

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
