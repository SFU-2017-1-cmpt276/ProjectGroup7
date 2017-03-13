//
//  ViewController.swift
//  EatIn
//
//  Created by Nicole Thomas on 2017-03-11.
//  Copyright © 2017 Nicole Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let CellIdentifier = "cellId"
    let SectionHeaderIdentifier = "taskHeaderId"
    
    var ingredients : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting variables
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.backgroundColor = .white
        collectionView!.alwaysBounceVertical = true
        collectionView!.register(IngredientCell.self, forCellWithReuseIdentifier: CellIdentifier)
        collectionView!.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SectionHeaderIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! IngredientCell
        cell.ingredientLabel.text = ingredients[indexPath.row]
        cell.deleteImage.image = UIImage(named: "close.png")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let Headercell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderIdentifier, for: indexPath) as! Header
        Headercell.parentViewController = self
        return Headercell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ingredients.remove(at: indexPath.row)
        collectionView.reloadData()
    }
    
    func addToList(taskName : String) {
        ingredients.append(taskName)
        collectionView?.reloadData()
    }
    
    
}

class Header : BaseCell {
    
    var parentViewController : ViewController?
    
    let IngredientField : UITextField = {
        let field = UITextField()
        field.placeholder = "Ingredient"
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let addIngredient : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupViews() {
        addSubview(IngredientField)
        addSubview(addIngredient)
        
        addIngredient.addTarget(self, action: #selector(Ingredient), for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-[v1(80)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": IngredientField, "v1": addIngredient]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": IngredientField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": addIngredient]))
    }
    
    
    func Ingredient(sender: Any?) {
        if let viewController = parentViewController {
            viewController.addToList(taskName: IngredientField.text!)
            IngredientField.text = ""
        }
    }
}


class IngredientCell : BaseCell {
    var parentViewController : ViewController?
    
    let ingredientLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
       override func setupViews() {
        addSubview(ingredientLabel)
        addSubview(deleteImage)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0][v1(10)]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": ingredientLabel, "v1": deleteImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": ingredientLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": deleteImage]))
    }
    
    
    
}


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
