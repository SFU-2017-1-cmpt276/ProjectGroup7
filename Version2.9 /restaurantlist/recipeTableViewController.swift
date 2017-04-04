//  recipeViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-04-02.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class recipeTableViewController: UITableViewController {
    
    var data: [recipe] = []
    
    
    @IBOutlet var recipeTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for object in data{
            print(object.Name)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pdfView", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> recipeButton {
        let cell = recipeTable.dequeueReusableCell(withIdentifier: "recipe", for: indexPath) as! recipeButton
        cell.recipeName.text = data[indexPath.row].Name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedRow = recipeTable.indexPathForSelectedRow!.row
        let webController: webViewController = segue.destination as! webViewController
        
        webController.ID = data[selectedRow].ID
        
    }
    
}
