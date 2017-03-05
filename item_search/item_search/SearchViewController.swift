//
//  SearchViewController.swift
//  MenuItemSearch
//
//  Created by Nicole Thomas 2017-02-26.
//  Copyright © 2017 Nicole Thomas. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate
{

    var marrMenuItemList = [String]()
    var marrFilteredMenuItemList = [String]()
    
    @IBOutlet var tblMenuItem: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        marrMenuItemList = ["Burger", "Cookie", "Doughnut", "Muffin", "Sandwich", "Soup", "Sushi"]
        self.tblMenuItem.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.marrFilteredMenuItemList.count
        } else {
            return self.marrMenuItemList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        let cellMenuItem = self.tblMenuItem.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var MenuItemName : String!
        if tableView == self.searchDisplayController!.searchResultsTableView {
            MenuItemName = marrFilteredMenuItemList[indexPath.row]
        } else {
            MenuItemName = marrMenuItemList[indexPath.row]
        }
        
        cellMenuItem.textLabel?.text = MenuItemName
        
        return cellMenuItem
    }
    
    func filterTableViewForEnterText(_ searchText: String) {
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        
        let array = (self.marrMenuItemList as NSArray).filtered(using: searchPredicate)
        self.marrFilteredMenuItemList = array as! [String]
        self.tblMenuItem.reloadData()
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearch searchString: String?) -> Bool {
        self.filterTableViewForEnterText(searchString!)
        return true
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            self.filterTableViewForEnterText(self.searchDisplayController!.searchBar.text!)
            return true
    }

}
