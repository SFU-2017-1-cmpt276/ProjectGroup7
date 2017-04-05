//
//  ItemViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-04.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//
//Programmers: Fran, Grazietta,Nicole, Jordan
//coding standard:
//The names of variables and items should be self-descriptive
//if any changes are made to existing code in this file notify all programmers in the group chat
//Xcode bracket convention should be followed
//only when the updates you have made are compiling, may this projected be submitted to the master branch on github
//notify all programmers of any existing bugs in the compiling version of the project submitted on the github master branch






import UIKit

class ItemViewController: UIViewController, UIPickerViewDelegate,UITableViewDataSource,UIPickerViewDataSource,  BEMCheckBoxDelegate {
  
    
    //These are the checker mark variables from the viewController. They are of type BEMCheckBox
    @IBOutlet weak var VegetarianBox: BEMCheckBox!
    @IBOutlet weak var VeganBox: BEMCheckBox!
    @IBOutlet weak var TreenutBox: BEMCheckBox!
    @IBOutlet weak var EggBox: BEMCheckBox!
    @IBOutlet weak var MilkBox: BEMCheckBox!
    @IBOutlet weak var FishBox: BEMCheckBox!
    @IBOutlet weak var ShellfishBox: BEMCheckBox!
    @IBOutlet weak var WheatBox: BEMCheckBox!
    @IBOutlet weak var PeanutBox: BEMCheckBox!
    
    
    var newData: [ItemListClass] = []
    
    //set up flags for sorting
    var veggieFlag = 0;
    var veganFlag = 0
    var peanutFlag = 0
    var treenutFlag = 0
    var eggFlag = 0
    var milkFlag = 0
    var fishFlag = 0
    var shellfishFlag = 0
    var wheatFlag = 0
    var flagTotal = 0
   
  
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var itemTable: UITableView!
    
    //initialize arrays for sorting
    var pickerData: [ItemListClass] = []
    var pickerNames: [String] = []
   
    
    //initialize an array of items to be filled with an array from viewcontroller
    var data: [ItemListClass] = []
    var selectedRow:Int = -1

  
    override func viewDidLoad() {
        
        newData = data
        
        super.viewDidLoad()
        VegetarianBox.delegate = self
        VeganBox.delegate = self
        PeanutBox.delegate = self
        TreenutBox.delegate = self
        EggBox.delegate = self
        MilkBox.delegate = self
        FishBox.delegate = self
        ShellfishBox.delegate = self
        WheatBox.delegate = self
        PeanutBox.delegate = self
     
        
        self.data = self.data.sorted(by: {$0.Calories < $1.Calories})

        pickerNames = ["Low Calories", "Low Carb", "Low Fat","Low Sodium","High Protein","None"]
        pickerView.delegate = self
        pickerView.dataSource = self
        
        itemTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    //This function is responsible for filtering the data loaded into the tableView. It filters the data, and reloads the tableView after
    
    func didTap(_ checkBox: BEMCheckBox) {
        
        //tap the vegetarian option
        if checkBox == VegetarianBox && VegetarianBox.on == true{
            
            newData = newData.filter { $0.Vegetarian == true}
            veggieFlag = 1
            print("I ❤️ veg")
            flagTotal = 1
            itemTable.reloadData()
        }
        
        //tap the peanut option
        if checkBox == PeanutBox && PeanutBox.on == true{
            print("I ❤️ peanuts")
            newData = newData.filter {$0.Peanut == false}
            peanutFlag = 1
            
            flagTotal = 1
            itemTable.reloadData()
        }
        
        //tap the vegan option
        if checkBox == VeganBox && VeganBox.on == true{
            newData = newData.filter {$0.Vegan == true}
            veganFlag = 1
             print("I ❤️ veggies")
            flagTotal = 1
            itemTable.reloadData()
        }
        
        //tap the treenut option
        if checkBox == TreenutBox && TreenutBox.on == true{
            newData = newData.filter {$0.TreeNut == false}
            treenutFlag = 1
            flagTotal = 1
            itemTable.reloadData()
        }
        
        //tap the egg option
        if checkBox == EggBox && EggBox.on == true{
            newData = newData.filter {$0.Egg == false}
            
            eggFlag = 1
            flagTotal = 1
            itemTable.reloadData()
        }
        
        
        //tap the milk option
        if checkBox == MilkBox && MilkBox.on == true{
            newData = newData.filter {$0.Milk == false}
            milkFlag = 1
            flagTotal = 1
            itemTable.reloadData()
        }
        
        //tap the fish option
        if checkBox == FishBox && FishBox.on == true{
            newData = newData.filter {$0.Fish == false}
            fishFlag = 1
            flagTotal = 1
            itemTable.reloadData()
        }
        
        //tap the Shellfish option
        if checkBox == ShellfishBox && ShellfishBox.on == true{
            newData = newData.filter {$0.ShellFish == false}
            shellfishFlag = 1
            flagTotal = 1
            itemTable.reloadData()
        }
        
        //tap the wheat option
        if checkBox == WheatBox && WheatBox.on == true{
            newData = newData.filter {$0.Wheat == false}
            wheatFlag = 1
            flagTotal = 1
            itemTable.reloadData()
        }
        
        
        //untap the vegetarian option
        if checkBox == VegetarianBox && VegetarianBox.on == false{
            print("I 🤢 veggies")
            newData = data
            veggieFlag = 0
            flagTotal = 0
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
        
        itemTable.reloadData()
        }
      
        
        //untap the vegan option
        if checkBox == VeganBox && VeganBox.on == false{
            newData = data
            veganFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
        itemTable.reloadData()
            
        }
        
        //untap the peanut option
        if checkBox == PeanutBox && PeanutBox.on == false{
            newData = data
            peanutFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == true}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
            itemTable.reloadData()
            
        }
        
        //untap the treenut option
        if checkBox == TreenutBox && TreenutBox.on == false{
            newData = data
            treenutFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == true}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
            itemTable.reloadData()
            
        }
        

        //untap the egg option
        if checkBox == EggBox && EggBox.on == false{
            newData = data
            eggFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == true}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
            itemTable.reloadData()
            
        }
        
        
        
        //untap the milk option
        if checkBox == MilkBox && MilkBox.on == false{
            newData = data
            milkFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == false}
                flagTotal = 1
            }
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
            itemTable.reloadData()
            
        }
        
        
        //untap the fish option
        if checkBox == FishBox && FishBox.on == false{
            newData = data
            fishFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == true}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
            itemTable.reloadData()
            
        }
        
        
        
        //untap the shellfish option
        if checkBox == ShellfishBox && ShellfishBox.on == false{
            newData = data
            shellfishFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == true}
                flagTotal = 1
            }
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            
            
            if wheatFlag == 1{
                newData = newData.filter {$0.Wheat == false}
                flagTotal = 1
            }
            itemTable.reloadData()
            
        }
        
        
        
        //untap the wheat option
        if checkBox == WheatBox && WheatBox.on == false{
            newData = data
            wheatFlag = 0
            flagTotal = 0
            
            if veggieFlag == 1{
                newData = newData.filter {$0.Vegetarian == true}
                flagTotal = 1
            }
            
            if peanutFlag == 1{
                newData = newData.filter {$0.Peanut == false}
                flagTotal = 1
            }
            
            if treenutFlag == 1{
                newData = newData.filter {$0.TreeNut == false}
                flagTotal = 1
            }
            
            if eggFlag == 1{
                newData = newData.filter {$0.Egg == false}
                flagTotal = 1
            }
            
            if milkFlag == 1{
                newData = newData.filter {$0.Milk == false}
                flagTotal = 1
            }
            
            if veganFlag == 1{
                newData = newData.filter {$0.Vegan == true}
                flagTotal = 1
            }
            
            if shellfishFlag == 1{
                newData = newData.filter {$0.ShellFish == false}
                flagTotal = 1
            }
            
            
            if fishFlag == 1{
                newData = newData.filter {$0.Fish == false}
                flagTotal = 1
            }
            itemTable.reloadData()
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //this function returns the number of rows to be loaded into the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if flagTotal == 1{
            return newData.count
        }
        
        return data.count
    }
    
    //This function loads the data into the cells. If the flagTotal is set to 1, then at least one of the checkMarks are selected and a different array is used
    //It returns the cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ButtonCell
        
        if flagTotal == 1{
            cell2.rowLabel.text = newData[indexPath.row].Name
            cell2.tapAction = {
                (cell) in self.showAlertForRow(tableView.indexPath(for: cell)!.row)
            }
            return cell2
        }
        
        cell2.rowLabel.text = data[indexPath.row].Name
        cell2.tapAction = {
            (cell) in self.showAlertForRow(tableView.indexPath(for: cell)!.row)
        }
        return cell2
    }
    
    //This function is responsible for the item detail pop up when the user selects an item
    func showAlertForRow(_ row: Int) {
        
        print(data[row].Restuarant)
        
        if flagTotal == 1{
            
            if newData[row].Restuarant == "PizzaHut"
            {  let alert = UIAlertController(
                title: newData[row].Restuarant,
                message: "Calories:  \(newData[row].Calories)/slice\nFats:  \(newData[row].Fats)\nCarbs:  \(newData[row].Carbs)\nProtein:  \(newData[row].Protein)\nSodium:  \(newData[row].Sodium)",
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
            title: newData[row].Restuarant,
            message: "Calories:  \(newData[row].Calories)\nFats:  \(newData[row].Fats)\nCarbs:  \(newData[row].Carbs)\nProtein:  \(newData[row].Protein)\nSodium:  \(newData[row].Sodium)",
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
            
        else{
            if data[row].Restuarant == "PizzaHut"{
                let alert = UIAlertController(
                    title: data[row].Name,
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
                title: data[row].Name,
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
    
    
    //****PickerView functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return pickerNames.count
    }
    
    //This function returns the names to be viewed on the picker
    
    func pickerView(_ pickerView: UIPickerView,titleForRow row: Int,forComponent component: Int) -> String?{
        return pickerNames[row]
    }
    
    //This function sorts the data depending on which category is selected on the pickerView
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if flagTotal == 1{
            
            if row == 0{
                self.newData = self.newData.sorted(by: {$0.Calories < $1.Calories})
            }
            
            
        if row == 1{
                
                
            self.newData = self.newData.sorted(by: {$0.Carbs < $1.Carbs})
                
            }
            
            if row == 2{
                self.newData = self.newData.sorted(by: {$0.Fats < $1.Fats})
                
            }
            
            if row == 3{
                self.newData =  self.newData.sorted(by: {$0.Sodium < $1.Sodium})
            }
            
            if row == 4{
                self.newData =  self.newData.sorted(by: {$0.Protein > $1.Protein})
            }
            
            itemTable.reloadData()
        }
        
        else {
        
            if row == 0{
                self.data = self.data.sorted(by: {$0.Calories < $1.Calories})
            }
        
        
            if row == 1{
                self.data = self.data.sorted(by: {$0.Carbs < $1.Carbs})
            }
        
            if row == 2{
                self.data = self.data.sorted(by: {$0.Fats < $1.Fats})
            
            }
        
            if row == 3{
                self.data =  self.data.sorted(by: {$0.Sodium < $1.Sodium})
            }
        
            if row == 4{
                self.data =  self.data.sorted(by: {$0.Protein > $1.Protein})
            }
            
            if row == 5{
                self.data = self.data.sorted( by: {$0.Name < $1.Name})
            }
            
            itemTable.reloadData()
        }
    }

}

