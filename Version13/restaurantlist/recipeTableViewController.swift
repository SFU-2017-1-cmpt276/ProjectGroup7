
/*
  recipeViewController.swift
  restaurantlist

  Created by Grazietta Hof on 2017-04-02.
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

class recipeTableViewController: UITableViewController {
    
    var data: [recipe] = [] //initiate array of recipe objects to loaded from previus view controller
    @IBOutlet var recipeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**************************************************************************************************/
    //        This function is returns the number of cells to be loaded into the table view           //
    /**************************************************************************************************/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    /**************************************************************************************************/
    //                This function calls another function when a recipe cell is selected             //
    /**************************************************************************************************/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pdfView", sender: nil)
    }
    
    /**************************************************************************************************/
    //   This function loads the respective image and labels into the table view from data array      //
    /**************************************************************************************************/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> recipeTableViewCell {
        let cell = recipeTable.dequeueReusableCell(withIdentifier: "recipe", for: indexPath) as! recipeTableViewCell
        
        cell.recipeName.text = data[indexPath.row].Name
        var imageName = "image" + String(Int(data[indexPath.row].ID))
        print(imageName)
        cell.recipeImage.image = UIImage(named: imageName)
        cell.accuracy.text = String(data[indexPath.row].accuracy) + "% MATCH"
        
        return cell
    }
    
    /**************************************************************************************************/
    //    This function passed the ID of the recipe selected by the user to the webViewController     //
    /**************************************************************************************************/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedRow = recipeTable.indexPathForSelectedRow!.row
        let webController: webViewController = segue.destination as! webViewController
        
        webController.ID = data[selectedRow].ID
        
    }
    
}
