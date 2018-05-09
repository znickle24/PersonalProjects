//
//  WhiskeyVC.swift
//  WESoup
//
//  Created by Zander Nickle on 4/18/18.
//  Copyright © 2018 Zander Nickle. All rights reserved.
//

import UIKit

class WhiskeyVC: UIViewController {
  var whiskeys: [WhiskeyResponse]!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
  }
extension WhiskeyVC: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return whiskeys.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//    if (whiskeys[indexPath.row].whiskeys[0].whiskeyInWarehouse != "0" || whiskeys[indexPath.row].whiskeys[0].whiskeyOnOrder != "0") {
      cell.detailTextLabel?.text = "\(whiskeys[indexPath.row].whiskeys[0].whiskeyName) In Warehouse: \(whiskeys[indexPath.row].whiskeys[0].whiskeyInWarehouse)"
      cell.textLabel?.text = "\(whiskeys[indexPath.row].whiskeys[0].whiskeyName) on order: \(whiskeys[indexPath.row].whiskeys[0].whiskeyOnOrder)"
//    }
    
    return cell
  }
  

  
}
