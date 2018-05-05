//
//  WhiskeyViewController.swift
//  WhiskeySoup
//
//  Created by Zander Nickle on 4/12/18.
//  Copyright © 2018 Zander Nickle. All rights reserved.
//

import UIKit

class WhiskeyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
extension WhiskeyViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    cell.textLabel?.text = ""
    cell.detailTextLabel?.text = ""
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1;
  }
}
