import UIKit

class webViewController: UIViewController {
    
    
    
    var ID: Double = 0
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "recipe" + String(Int(ID))
        
        print(string)
        
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
