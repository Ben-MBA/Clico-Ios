//
//  DealsRangeTableViewController.swift
//  Clico
//
//  Created by Mohamed on 02/10/2016.
//  Copyright © 2016 HACHFI. All rights reserved.
//

import UIKit

protocol DealsRangeTableViewControllerDelegate {
    func dealsRangeTableViewController(_ dealsRangeTableViewController : DealsRangeTableViewController, didSelect range : Int)
}

class DealsRangeTableViewController: UITableViewController {
    var delegate : DealsRangeTableViewControllerDelegate!
    
    let ranges = [0, 5, 10, 25, 30, 50, 70]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranges.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealCell")
        cell?.textLabel?.text = "\(ranges[indexPath.row])%"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.dealsRangeTableViewController(self, didSelect: ranges[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
