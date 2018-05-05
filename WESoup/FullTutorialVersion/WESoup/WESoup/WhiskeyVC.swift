//
//  WhiskeyVC.swift
//  WESoup
//
//  Created by Zander Nickle on 4/18/18.
//  Copyright © 2018 Zander Nickle. All rights reserved.
//

import UIKit

class WhiskeyVC: UIViewController {
  var whiskeys: [Whiskeys]!
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
    cell.detailTextLabel?.text = "Bottles of \(whiskeys[indexPath.row].whiskeyName) In Warehouse: \(whiskeys[indexPath.row].whiskeyInWarehouse)"
    cell.textLabel?.text = "Bottles On Order: \(whiskeys[indexPath.row].whiskeyOnOrder)"
    
    return cell
  }
  

  
}
