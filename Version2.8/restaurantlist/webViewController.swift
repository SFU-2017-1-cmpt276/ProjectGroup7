//
//  webViewController.swift
//  restaurantlist
//
//  Created by Grazietta Hof on 2017-03-29.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import UIKit

class webViewController: UIViewController {

    
    
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pdfURL = Bundle.main.url(forResource: "recipe1", withExtension: "pdf", subdirectory: nil, localization: nil)  {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
