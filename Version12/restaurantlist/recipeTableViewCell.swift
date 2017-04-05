//
//  recipeTableViewCell.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-04-04.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//
//coding standard:
//The names of variables and items should be self-descriptive
//if any changes are made to existing code in this file notify all programmers in the group chat
//Xcode bracket convention should be followed
//only when the updates you have made are compiling, may this projected be submitted to the master branch on github
//notify all programmers of any existing bugs in the compiling version of the project submitted on the github master branch

import UIKit

class recipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var accuracy: UILabel!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    @IBOutlet weak var recipeName: UILabel!
    
 
   // @IBOutlet weak var accuracy: UILabel!
 
   // @IBOutlet weak var recipeName: UILabel!
   // @IBOutlet weak var recipeName: UILabel!
    
   // @IBOutlet weak var recipeImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
