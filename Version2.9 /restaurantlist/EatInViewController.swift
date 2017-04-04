//
//  ViewController.swift
//  EatIn
//
//  Created by Nicole Thomas on 2017-03-11.
//  Copyright © 2017 Nicole Thomas. All rights reserved.
//

//coding standard:
//The names of variables and items should be self-descriptive
//if any changes are made to existing code in this file notify all programmers in the group chat
//Xcode bracket convention should be followed
//only when the updates you have made are compiling, may this projected be submitted to the master branch on github
//notify all programmers of any existing bugs in the compiling version of the project submitted on the github master branch




import UIKit

class EatInViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView! //create collectionview variable
    
    let CellIdentifier = "cellId" //create identifiers for Header and input cells
    let SectionHeaderIdentifier = "taskHeaderId"
    
    var ingredients : [String] = [] //initiate array for ingredients
    var recipeIDs: [recipe] = []
    var  searchArray: [ingredient] = []
    var recipes: [recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeIDs = parseCSVRecipes(name: "namesRecipes")
        
        // Setting up variables and delegating control and datasource to collectionView
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.backgroundColor = .white
        collectionView!.alwaysBounceVertical = true
        collectionView!.register(IngredientCell.self, forCellWithReuseIdentifier: CellIdentifier)
        collectionView!.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SectionHeaderIdentifier)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        searchArray = parseCSVIngredients(name: "ingredientsofRecipes")
        
        
        //print the search array loaded from the csv
        for object in searchArray{
            print(object.Name)
        }
        
    }
    
    //This function checks to see if the user input ingredients matches any recipe ingredients and returns the recipe ID, if non of the inputs match the the first recipe is returned
    //The strings still need to be divided into words so that if the user inputs cheddar for instance and the recipe states: "cheddar cheese", its still a match
    func search_for_ingredient() -> [recipe]{
        recipes = []
        for object in searchArray{
            for input in ingredients{
                if ((object.Name.lowercased().range(of: input.lowercased()) != nil) || (input.lowercased().range(of:object.Name.lowercased())) != nil) {
                    recipeIDs[Int(object.ID-1)].Count =  recipeIDs[Int(object.ID-1)].Count + 1
                }
            }
        }
        for recipe in recipeIDs{
            if recipe.Count != 0{
                recipes.insert(recipe, at: 0)
                
            }
            
        }
        
        recipes = recipes.sorted(by: {$0.Count > $1.Count})
        
        for recipe in recipes{
            if ingredients.count != 0{
                recipe.accuracy = (recipe.Count/Double(ingredients.count))*100
            }
            recipe.Count = 0
        }
    
        return recipes
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "recipeList"{
            
            recipes = search_for_ingredient()
            let recipeList: recipeTableViewController = segue.destination as! recipeTableViewController
            recipeList.data =  recipes
        }
        
    }
    
    //this function loads the ingredients and returns an array of ingredient objects
    
    func parseCSVIngredients(name: String) -> Array<ingredient> {
        let path = Bundle.main.path(forResource: name, ofType: "csv")
        var ret: [ingredient] = []
        do{
            
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            var index = 0
            
            for row in rows {
                
                let name = row["Name"]!
                let ID = Double(row["ID"]!)
                
                let iItemToAdd = ingredient(Name: name, ID: ID!)
                
                ret.insert(iItemToAdd, at: index)
                index = index + 1
                
                
            }
            
        }
        catch{
            print ("Could not open file " + name)
        }
        
        return ret
    }
    
    
    func parseCSVRecipes(name: String) -> Array<recipe> {
        let path = Bundle.main.path(forResource: name, ofType: "csv")
        var ret: [recipe] = []
        do{
            
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            var index = 0
            
            for row in rows {
                
                let name = row["Recipe"]!
                let ID = Double(row["ID"]!)
                let Count = 0
                
                let iItemToAdd = recipe(Name: name, ID: ID!, Count: Double(Count), accuracy: 0)
                
                ret.insert(iItemToAdd, at: index)
                index = index + 1
            }
            
        }
        catch{
            print ("Could not open file " + name)
        }
        
        return ret
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
    
    //function to check if ingredient already present in the ingredients array
    func ingredientCheck(ingredientName : String) -> Bool{
        var flag = false
        var i = 0
        while i < ingredients.count{
            if ingredientName == ingredients[i]{
                flag = true
                break
            }
            i += 1
        }
        return flag
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
        if ingredients.count < 1 {
            let alertController = UIAlertController(title: "Error", message:
                "A minimum of 1 ingredient is required for recipe search", preferredStyle: UIAlertControllerStyle.alert)
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
            
            /* let recipeNumber*/
            //search_for_ingredient(array: ingredients)
            // performSegue(withIdentifier: "recipeList", sender: nil)
        }
    }
}
//set up header cell class
class Header : BaseCell {
    
    var parentViewController : EatInViewController? //establish viewcontroller variable
    
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
                //create pop-up if ingredient already in ingredients array
            else if viewController.ingredientCheck(ingredientName: IngredientField.text!){
                let alertController = UIAlertController(title: "Error", message: "Please insert an ingredient not already on the list", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                parentViewController?.present(alertController, animated: true, completion: nil)
                
            }
                //add ingredient to array if correctly spelt and doesnt contain a digit
            else if isReal(word: IngredientField.text!) && !isalpha(word: IngredientField.text!) {
                viewController.addToList(ingredientName: IngredientField.text!)
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
    var parentViewController : EatInViewController? //establish ViewController variable
    
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
