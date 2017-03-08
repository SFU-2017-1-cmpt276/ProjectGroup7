//
//  ItemViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-04.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableItem: UITableView!
    
    //initialize an array of items to be filled with an array from viewcontroller
    var data: [ItemListClass] = []
    var selectedRow:Int = -1
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ButtonCell
       cell2.rowLabel.text = data[indexPath.row].Name
       cell2.tapAction = {
        (cell) in self.showAlertForRow(tableView.indexPath(for: cell)!.row)
        }
        return cell2
    }
    
    //This function is responsible for the item detail pop up
    func showAlertForRow(_ row: Int) {
        let alert = UIAlertController(
            title: data[row].Name,
            message: "Calories:  \(data[row].Calories)\nFats:  \(data[row].Fats)\nCarbs:  \(data[row].Carbs)\nProtein:  \(data[row].Protein)\nSodium:  \(data[row].Sodium)",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Gotcha!", style: UIAlertActionStyle.default, handler: { (test) -> Void in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(
            alert,
            animated: true,
            completion: nil)
    }
}
