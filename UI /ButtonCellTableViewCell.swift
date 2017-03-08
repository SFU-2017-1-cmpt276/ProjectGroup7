//
//  ButtonCellTableViewCell.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-05.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//last updated by Grazietta Hof on 2017-08-03
//programmers: Grazietta Hof

//coding standard:
//The names of variables and items should be self-descriptive
//if any changes are made to existing code in this file notify all programmers in the group chat
//Xcode bracket convention should be followed
//only when the updates you have made are compiling, may this projected be submitted to the master branch on github
//notify all programmers of any existing bugs in the compiling version of the project submitted on the github master branch

//the following class controls the button on the itemViewController that has a segue to item details
import UIKit

class ButtonCell: UITableViewCell {
    
    @IBOutlet weak var rowLabel: UILabel!
    
    var tapAction: ((UITableViewCell) -> Void)?
    
    @IBAction func buttonTap(_ sender: AnyObject) {
        tapAction?(self)
    }


}
