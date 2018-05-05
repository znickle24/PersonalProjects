//
//  ViewController.swift
//  WESoup
//
//  Created by Zander Nickle on 4/18/18.
//  Copyright © 2018 Zander Nickle. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  
  @IBOutlet weak var whiskeyName: UITextField!
  let webView = WKWebView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let mainURL = URL(string: "https://webapps2.abc.utah.gov/Production/OnlineInventoryQuery/IQ/InventoryQuery.aspx")!
    let request = URLRequest(url: mainURL)
    webView.frame = CGRect(x: 0, y: 300, width: 300, height: 300)
    webView.load(request)
    view.addSubview(webView)
  }
  
  
  override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
    guard let whiskeys = sender as AnyObject as? [Whiskeys],
        let whiskeysVC = segue.destination as? WhiskeyVC
        else {return}
    whiskeysVC.whiskeys = whiskeys
  }
  @IBAction func onSpecificButtonPressed() {
    
  }
  //this might be what I need to make sure that the completion of loading the webview javascript is done before moving on
  func webView (_ webView: WKWebView, didFinish navigation: WKNavigation) {
    
  }
  //this perform action is working, but the others are not. I can verify it's working because
  @objc func performAction() {
    webView.evaluateJavaScript("document.getElementById('ContentPlaceHolderBody_tbCscCode').value = '021602'", completionHandler: {(value, error) in
      print(value)
      print("Error: \(error)")
    })
    print("Was able to insert the value")
  }
  @objc func performAction1() {
    webView.evaluateJavaScript("document.forms['form1'].submit()", completionHandler: nil)
    print("Was able to hit submit")
  }
  @objc func performAction2() {
    webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: { (innerHTML, error) in
      do {
        let whiskeyResponse = try WhiskeyResponse(innerHTML, whiskeyTitle: "E H Taylor Small Batch")
        self.performSegue(withIdentifier: "ShowWhiskeys", sender: whiskeyResponse.whiskeys)
      } catch{}
    })
  }
  @IBAction func onSearchListButtonPressed() {
    //this needs to complete prior to the submit button being pressed. All else is fine. Need to have a wait or some form of completion handler.
//      let navigationDelegate = webView.navigationDelegate
//      let uiDelegate = webView.uiDelegate
    
    self.perform(#selector(performAction), with: nil, afterDelay: 0.0)
    self.perform(#selector(performAction1), with: nil, afterDelay: 1.5)
    self.perform(#selector(performAction2), with: nil, afterDelay: 4.0)
  }
  
}

