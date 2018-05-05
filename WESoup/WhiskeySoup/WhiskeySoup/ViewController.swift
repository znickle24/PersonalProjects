//
//  ViewController.swift
//  WhiskeySoup
//
//  Created by Zander Nickle on 4/12/18.
//  Copyright © 2018 Zander Nickle. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  @IBOutlet weak var whiskeyTF: UITextField!
  
  let webView = WKWebView()
  var counter = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let url = URL(string: "https://webapps2.abc.utah.gov/Production/OnlineInventoryQuery/IQ/InventoryQuery.aspx")!
    let request = URLRequest(url: url)
    webView.frame = CGRect(x: 0, y: 300, width: 300, height: 300)
    webView.load(request)
    var pappy10 = "Pappy 10 Year"
    var pappy12 = "Pappy 12 Year"
    var pappy15 = "Pappy 15 Year"
    var pappy20 = "Pappy 20 Year"
    let pappy23 = "Pappy 23 Year"
    let billLarue = "William Larue Weller"
    let georgeTStagg = "George T Stagg"
    let saz18 = "Sazerac 18 Year"
    let eagleRare17 = "Eagle Rare 17 Year"
    let thomHandy = "Thomas Handy"
    let staggJr = "Stagg Junior"
    let sazRye6 = "Sazerac Rye 6 Year"
    let ehTSmallBatch = "E H Taylor Small Batch"
    let ehTSingleBarrell = "E H Taylor Single Barrel"
    let ehTBarrelProof = "E H Taylor Barrel Proof"
    let ehTStraightRye = "E H Taylor Straight Rye"
    let ehTFourGrain = "E H Taylor Four Grain"
    let whistlePig12 = "Whistlepig Rye 12 Year"
    let whistlePig15 = "Whistlepig Rye 15 Year"
    let elijah18 = "Elijah Craig 18 Year"
    let yamazaki12 = "Yamazaki 12 Year"
    let yamazaki18 = "Yamazaki 18 Year"
    let suntoryHibiki = "Suntory Hibiki"
    let hibikiHarmony = "Hibiki Harmony"
    var whiskeyDic: [String: String] = [pappy10: "020146", pappy12: "021906", pappy15: "020150", pappy20: "021016", pappy23: "021030",billLarue: "022086", georgeTStagg: "018416", eagleRare17: "017756", thomHandy: "027036", staggJr: "021540",sazRye6: "027100", ehTSmallBatch: "021602", ehTBarrelProof: "021600", ehTSingleBarrell: "021589", ehTStraightRye: "027101",ehTFourGrain: "021605", whistlePig12: "027145", whistlePig15: "015320", elijah18: "017920", yamazaki12: "015996", yamazaki18: "015986", suntoryHibiki: "015960", hibikiHarmony: "015980"]
    
    
    var searchString = "document.getElementByID('ContentPlaceHolderBody_tbCscCode').value=021602"
    webView.evaluateJavaScript(searchString, completionHandler: nil)
    print("should fill in first field")
    var submit = "document.getElementByID('form1').submit();"
    webView.evaluateJavaScript(submit, completionHandler: nil)
    view.addSubview(webView)
    
    }
  @IBAction func whiskeyButtonTapped(_ sender: UIButton) {
    var counter = 0
//    for key in whiskeyDic{
//      switch counter {
//      case 0: var searchString = "document.getElementByID('ContentPlaceHolderBody_tbCscCode'.value=\(key)'"
//      webView.evaluateJavaScript(searchString, completionHandler: nil)
//      case 1:
//        var submit = "document.getElementByID('form1').submit();"
//        webView.evaluateJavaScript(submit, completionHandler: nil)
//      default:
//        break
//      }
    }
  }

//    webView.evaluateJavaScript("document.getElementByID('ContentPlaceHolderBody_tbCscCode'.value='\(value)'", completionHandler: nil)
//}
//      print(value)
//      webView.evaluateJavaScript("document.getElementByTagName('html')[0]'.innerHTML", completionHandler: {(value, error) in
//        print("INNER HTML: \(value)")
//        print("ERROR \(error)")
//      })



