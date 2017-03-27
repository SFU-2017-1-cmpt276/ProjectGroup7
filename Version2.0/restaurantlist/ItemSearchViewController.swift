//
//  ItemSearchViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-25.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class ItemSearchViewController: UITableViewController{
    
    @IBOutlet weak var itemTable: UITableView!
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var popUpView: UIView!
    
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
        popUpView.isHidden = true
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    //this function returns the number of rows to be loaded into the tableview
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if searchController.isActive && searchController.searchBar.text != "" {
            return self.filteredData.count
        
        }
        else{
            return data.count
            }
    }
    
    //This function loads the data into the cells. If the flagTotal is set to 1, then at least one of the checkMarks are selected and a different array is used. It returns the cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as UITableViewCell?
        
        if searchController.isActive && searchController.searchBar.text != "" {
        
            cell?.textLabel?.text = filteredData[indexPath.row].Name
      
            return cell!}
        
        else{
            cell?.textLabel?.text = data[indexPath.row].Name
            return cell!
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredData = data.filter({( object : ItemListClass) -> Bool in
            return object.Name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}
    

    //This function is responsible for the item detail pop up
   /* func showAlertForRow(_ row: Int) {
        
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
    }*/

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
 









