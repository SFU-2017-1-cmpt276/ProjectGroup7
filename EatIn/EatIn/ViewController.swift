//
//  ViewController.swift
//  EatIn
//
//  Created by Nicole Thomas on 2017-03-11.
//  Copyright © 2017 Nicole Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

      
    @IBOutlet weak var collectionView: UICollectionView! //create collectionview variable
    
    let CellIdentifier = "cellId" //create identifiers for Header and input cells
    let SectionHeaderIdentifier = "taskHeaderId"
   
    var ingredients : [String] = [] //initiate array for ingredients
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up variables and delegating control and datasource to collectionView
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.backgroundColor = .white
        collectionView!.alwaysBounceVertical = true
        collectionView!.register(IngredientCell.self, forCellWithReuseIdentifier: CellIdentifier)
        collectionView!.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SectionHeaderIdentifier)
    }
    //set up collectionView cell variables
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    //set up collectionView cell variables
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! IngredientCell
        cell.ingredientLabel.text = ingredients[indexPath.row]
        cell.deleteImage.image = UIImage(named: "close.png")
        return cell
    }
    
    //set up collectionView cell variables
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let Headercell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderIdentifier, for: indexPath) as! Header
        Headercell.parentViewController = self
        return Headercell
    }
    
    //establsh size requirements for header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
    //create function to remove ingredient at selected row
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ingredients.remove(at: indexPath.row)
        collectionView.reloadData() //reload data to remove ingredient from array
    }
    
    //append new ingredient to array
    func addToList(ingredientName : String) {
        ingredients.append(ingredientName)
        collectionView?.reloadData() //reload data to include new ingredient
    }
    
   
    //segue protocol to next page if ingredients are < 5 or > 15 prevent segue and initiate pop-up alert
    //telling user of requirements
    @IBAction func RecipeSearch(_ sender: Any) {
        
        //create pop-up alert for >5 ingredients
        if ingredients.count < 5 {
            let alertController = UIAlertController(title: "Error", message:
            "A minimum of 5 ingredients are required for recipe search", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            present(alertController, animated: true, completion: nil)
            
        }
        //create pop-up alert for <15 ingredients
        else if ingredients.count > 15 {
            let alertController = UIAlertController(title: "Error", message:
                "A maximum of 15 ingredients is allowed for recipe search", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            present(alertController, animated: true, completion: nil)
            

        }
        //allow segue to recipe page if ingredients meet requirements
        else {
            performSegue(withIdentifier: "recipeList", sender: nil)
        }
    }
}
//set up header cell class
class Header : BaseCell {
    
    var parentViewController : ViewController? //establish viewcontroller variable
    
    //create textfield for user input
    let IngredientField : UITextField = {
        let field = UITextField()
        field.placeholder = "Ingredient"
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    //create button to add ingredient to array
    let addIngredient : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //set up subviews to present textfield and button
    override func setupViews() {
        addSubview(IngredientField)
        addSubview(addIngredient)
        
        addIngredient.addTarget(self, action: #selector(Ingredient), for: .touchUpInside)
        
        //set up view constraints for textfield and button layout
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-[v1(80)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": IngredientField, "v1": addIngredient]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": IngredientField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": addIngredient]))
    }
    
    //function for determining word is correctly spelt
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    //function to determine if user input contains digits
    func isalpha(word: String) -> Bool {
        let digit = CharacterSet.decimalDigits
        var flag = false
        for uni in word.unicodeScalars{
            
            if digit.contains(uni){
                flag = true
            }
        }
        return flag
    }
    
    //function to add ingredient to array if string meets requirements for being less than 15 letters, correctly spelt
    //and not containing any digits
    func Ingredient(sender: Any?) {
        
        // if the ingredient contains >15 letters create pop-up alert to alert user the max letters is 15 for ingredient
        if let viewController = parentViewController {
            if IngredientField.text!.utf16.count > 15 {
                let alertController = UIAlertController(title: "Error", message: "A maximum of 15 letters is allowed for an ingredient", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                parentViewController?.present(alertController, animated: true, completion: nil)
                
            }
                
            //add ingredient to array if correctly spelt and doesnt contain a digit
            else if isReal(word: IngredientField.text!) && !isalpha(word: IngredientField.text!) {
            viewController.addToList(taskName: IngredientField.text!)
            IngredientField.backgroundColor = UIColor.white
            IngredientField.text = ""
            }
                
                //change textfield to red if user input is incorrectly spelt or contains a digit
            else {
                IngredientField.backgroundColor = UIColor.red
            }
        }
    }
}

//create cells for ingredients
class IngredientCell : BaseCell {
    var parentViewController : ViewController? //establish ViewController variable
    
    //create label for ingredient
    let ingredientLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //create UIImage for close image in row containing ingredient
    let deleteImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //create views for label and close image
       override func setupViews() {
        addSubview(ingredientLabel)
        addSubview(deleteImage)
        
        //set up constraints for layout of ingredient cell with label and close image
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0][v1(10)]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": ingredientLabel, "v1": deleteImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": ingredientLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": deleteImage]))
    }
    
    
    
}

//create class for UICollectionViewCell
class BaseCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
