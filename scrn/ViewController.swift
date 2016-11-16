import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentController = WKUserContentController();
        contentController.add(
            self,
            name: "fidCallbackHandler"
        )
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(
            frame: self.view.frame,
            configuration: config
        )
        
        webView?.navigationDelegate = self
       
        view.addSubview(webView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = NSURL(string:"https://research2.fidelity.com/pi/etf-screener?user_id=testws&experience=mobile-native")
        let request = NSURLRequest(url: url as! URL)
        let _ = self.webView?.load(request as URLRequest)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == "fidCallbackHandler") {
            print("MobileInterface: \(message.body)")
        }
    }
    
}
