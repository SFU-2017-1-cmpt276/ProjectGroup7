//
//  recipeTableViewCell.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-04-04.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

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
