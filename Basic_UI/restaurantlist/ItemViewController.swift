//
//  ItemViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-04.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView.text = text
        
    }
    
    
    func setText(t: String){
        
        text = t
        if isViewLoaded{
        textView.text = t
        }
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

}
