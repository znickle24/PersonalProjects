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
  //dictionary for list button
  var whiskeyDic: [String: String] = ["Pappy 10 Year": "020146", "Pappy 12 Year": "021906", "Pappy 15 Year": "020150", "Pappy 20 Year": "021016", "Pappy 23 Year": "021030", "William Larue Weller": "022086", "George T Stagg": "018416", "Eagle Rare 17 Year": "017756", "Thomas Handy": "027036", "Stagg Junior": "021540", "Sazerac Rye 6 Year": "027100", "E H Taylor Small Batch": "021602", "E H Taylor Barrell Proof": "021600", "E H Taylor Single Barrell": "021589", "E H Taylor Straight Rye": "027101", "E H Taylor 4 Grain": "021605", "Whistle Pig 12 Year": "027145", "Whistle Pig 15 Year": "015320", "Elijah Craig 18 Year": "017920", "Yamazaki 12 Year": "015996", "Yamazaki 18 Year": "015986", "Suntory Hibiki": "015960", "Hibiki Harmony": "015980"]

  override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
    guard let whiskeys = sender as AnyObject as? [WhiskeyResponse],
        let whiskeysVC = segue.destination as? WhiskeyVC
        else {return}
    whiskeysVC.whiskeys = whiskeys
  }
  @IBAction func onSpecificButtonPressed() {
    
  }
  //this might be what I need to make sure that the completion of loading the webview javascript is done before moving on
  func webView (_ webView: WKWebView, didFinish navigation: WKNavigation) {
    
  }
  
  @objc func performAction(whiskeyCode: String) {
    webView.evaluateJavaScript("document.getElementById('ContentPlaceHolderBody_tbCscCode').value = '\(whiskeyCode)'", completionHandler: {(value, error) in
      print(value!)
      print("Error: \(String(describing: error))")
    })
    print("Was able to insert the value")
  }
  @objc func performAction1() {
    webView.evaluateJavaScript("document.forms['form1'].submit()", completionHandler: nil)
    print("Was able to hit submit")
  }
  var count = 0
  var whiskeyResponses: [WhiskeyResponse] = []
  @objc func performAction2(whiskeyName: String) {
    webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: { (innerHTML, error) in
      do {
        var whiskeyResponse = try WhiskeyResponse(innerHTML, whiskeyTitle: "\(whiskeyName)")
        self.whiskeyResponses.append(whiskeyResponse)
        self.count += 1
        //currently this can only work for one item in the list. Need to perform segue after all are done
        print(self.count)
        if self.count == 23 {
          self.performSegue(withIdentifier: "ShowWhiskeys", sender: self.whiskeyResponses)
        }
      } catch{}
    })
    
  }
  @IBAction func onSearchListButtonPressed() {
    //this needs to complete prior to the submit button being pressed. All else is fine. Need to have a wait or some form of completion handler.
//      let navigationDelegate = webView.navigationDelegate
//      let uiDelegate = webView.uiDelegate
    var delay = 0.0
    for (whiskeyName, whiskeyCode) in whiskeyDic {
      //currently, the compiler believes that action 0 should all be done in order for each value, then move on to action 1 for each value then action 2 for each value instead of doing all 3 per loop and then coming back to do the next value.
      
      self.perform(#selector(performAction), with: whiskeyCode, afterDelay: delay)
      delay += 1.5
      self.perform(#selector(performAction1), with: nil, afterDelay: delay)
      delay += 3.5
      self.perform(#selector(performAction2), with: whiskeyName, afterDelay: delay)
      delay += 1.0
    }
  }
  
}

