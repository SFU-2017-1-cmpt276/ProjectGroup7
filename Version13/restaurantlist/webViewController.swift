
/*

  ViewController.swift
  restaurantlist

  Created by Grazietta Hof on 2017-03-03.
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

class webViewController: UIViewController {
    
    var ID: Double = 0 //initialize ID of recipe to be loaded and passed on from a previous view controller
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        webView.scalesPageToFit = true
        
        //initialize the name of the pdf to be loaded
        let string = "recipe" + String(Int(ID))

        //load the respective recipe pdf into the view controller
        if let pdfURL = Bundle.main.url(forResource: string, withExtension: "pdf", subdirectory: nil, localization: nil){
            do {
                let data = try Data(contentsOf: pdfURL)
                webView.load(data, mimeType: "application/pdf", textEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                view.addSubview(webView)
                }
            catch {
                // catch errors here
            }
            
            // Do any additional setup after loading the view.
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
