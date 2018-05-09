//
//  WhiskeyResponse.swift
//  WESoup
//
//  Created by Zander Nickle on 4/19/18.
//  Copyright © 2018 Zander Nickle. All rights reserved.
//

import Foundation
import SwiftSoup

enum HTMLError: Error {
  case badInnerHTML
}
struct WhiskeyResponse {
  let whiskeys: [Whiskeys]
  
  init(_ innerHTML: Any?, whiskeyTitle: String) throws {
    guard let htmlString = innerHTML as? String else
    { throw HTMLError.badInnerHTML }
    var whiskeys = [Whiskeys]()
    let doc = try SwiftSoup.parse(htmlString)
    let whiskeyTitle = whiskeyTitle
    let bottlesInWarehouse = try doc.getElementById("ContentPlaceHolderBody_lblWhsInv")?.text()
    let bottlesOnOrder = try doc.getElementById("ContentPlaceHolderBody_lblWhsOnOrder")?.text()
    print("Bottles on order: \(bottlesOnOrder)")
    print("Bottles in warehouse: \(bottlesInWarehouse)")
    if (bottlesOnOrder != nil) {
      let whiskeyInfo = Whiskeys(whiskeyName: whiskeyTitle, whiskeyOnOrder: bottlesOnOrder!, whiskeyInWarehouse: bottlesInWarehouse!)
      whiskeys.append(whiskeyInfo)
    } else {
      let whiskeyNotShowing = Whiskeys(whiskeyName: whiskeyTitle, whiskeyOnOrder: "0", whiskeyInWarehouse: "0")
      whiskeys.append(whiskeyNotShowing)
    }
    self.whiskeys = whiskeys
  }
}
