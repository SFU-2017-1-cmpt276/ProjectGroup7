
/*

  ItemSearchViewController.swift
  restaurantList

  Created by Grazietta Hof on 2017-03-25.
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

class ItemSearchViewController: UITableViewController{
    
    @IBOutlet weak var itemTable: UITableView!
    let searchController = UISearchController(searchResultsController: nil)

    
    var data:[ItemListClass] = []
    var filteredData: [ItemListClass] = []

    //initialize the filtered array for search functionality
  
 
    override func viewDidLoad() {

            // Setup the Search Controller
            searchController.searchResultsUpdater = self
            searchController.searchBar.delegate = self
            definesPresentationContext = true
            searchController.dimsBackgroundDuringPresentation = false
            tableView.tableHeaderView = searchController.searchBar
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    /**************************************************************************************************/
    //          This function returns the number of rows to be loaded into the tableView              //
    /**************************************************************************************************/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            if searchController.isActive && searchController.searchBar.text != "" {
                return self.filteredData.count

            }

            else {
                return data.count
            }
    }
    
    func filterContentForSearchText(_ searchText: String) {
            filteredData = data.filter({( object : ItemListClass) -> Bool in
            return object.Name.lowercased().contains(searchText.lowercased())
            })
            tableView.reloadData()
     }

    /**************************************************************************************************/
    // This function loads the data into the cells.                                                   //
    //     * If the flagTotal is set to 1, then at least one of the checkMarks are selected           //
    //     * and a different array is used                                                            //
    //     * Return the cell                                                                          //
    /**************************************************************************************************/

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! ButtonCell

        if searchController.isActive && searchController.searchBar.text != ""{
            cell.rowLabel2.text = filteredData[indexPath.row].Name
            cell.tapAction = {
                (cell) in self.showAlertForRow(tableView.indexPath(for: cell)!.row)
            }
            return cell
        }

        cell.rowLabel2.text = data[indexPath.row].Name
        cell.tapAction = {
            (cell) in self.showAlertForRow(tableView.indexPath(for: cell)!.row)
        }
        return cell
    }
    
    /**************************************************************************************************/
    //                     This function is responsible for the item detail pop up                    //
    /**************************************************************************************************/
    
    func showAlertForRow(_ row: Int) {

        if searchController.isActive && searchController.searchBar.text != ""{
            if filteredData[row].Restuarant == "PizzaHut"{
                let alert = UIAlertController(
                title: filteredData[row].Restuarant + "\n" + filteredData[row].Name,
                message: "Calories:  \(filteredData[row].Calories)/slice\nFats:  \(filteredData[row].Fats)g\nCarbs:  \(filteredData[row].Carbs)g\nProtein:  \(filteredData[row].Protein)g\nSodium:  \(filteredData[row].Sodium)mg",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Gotcha!", style: UIAlertActionStyle.default, handler: { (test) -> Void in
                //self.dismiss(animated: true, completion: nil)
            }))

            self.present(
                alert,
                animated: true,
                completion: nil)
            }

            else{
                let alert = UIAlertController(
                    title: filteredData[row].Restuarant + "\n" + filteredData[row].Name,
                    message: "Calories:  \(filteredData[row].Calories)\nFats:  \(filteredData[row].Fats)g\nCarbs:  \(filteredData[row].Carbs)g\nProtein:  \(filteredData[row].Protein)g\nSodium:  \(filteredData[row].Sodium)mg",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Gotcha!", style: UIAlertActionStyle.default, handler: { (test) -> Void in
                    //self.dismiss(animated: true, completion: nil)
                }))

                self.present(
                    alert,
                    animated: true,
                    completion: nil)
                }
            }


        else{
            if data[row].Restuarant == "PizzaHut"{
            let alert = UIAlertController(
                title: data[row].Restuarant + "\n" + data[row].Name,
                message: "Calories:  \(data[row].Calories)/slice\nFats:  \(data[row].Fats)g\nCarbs:  \(data[row].Carbs)g\nProtein:  \(data[row].Protein)g\nSodium:  \(data[row].Sodium)mg",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Gotcha!", style: UIAlertActionStyle.default, handler: { (test) -> Void in
                self.dismiss(animated: true, completion: nil)
            }))

            self.present(
                alert,
                animated: true,
                completion: nil)
            }

            else{
                let alert = UIAlertController(
                    title: data[row].Restuarant + "\n" + data[row].Name,
                    message: "Calories:  \(data[row].Calories)\nFats:  \(data[row].Fats)g\nCarbs:  \(data[row].Carbs)g\nProtein:  \(data[row].Protein)g\nSodium:  \(data[row].Sodium)mg",
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

     }
    
}


extension ItemSearchViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension ItemSearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        //let searchBar = searchController.searchBar
        
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
 









