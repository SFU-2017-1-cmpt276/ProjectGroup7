//
//  ButtonCell.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-04.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//


import UIKit

class ButtonCell: UITableViewCell {
    var tapAction: ((UITableViewCell) -> Void)?
    
    
    
    
    @IBAction func buttonTap(_ sender: AnyObject) {
        tapAction?(self)
    }
}
