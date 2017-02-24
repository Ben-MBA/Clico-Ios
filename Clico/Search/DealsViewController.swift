//
//  DealsViewController.swift
//  Clico
//
//  Created by Mohamed on 30/08/2016.
//  Copyright © 2016 HACHFI. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var deals : [Deal]?
    var clients : [Client]?
    
    var isShareView : Bool{
        return navigationController?.title == "Share"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isShareView {
            navigationItem.title = "Historic"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deals = Deal.deals
        clients = Client.clients
        navigationItem.backBarButtonItem?.title = "Back"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ProfileState.sharedState.isTrader {
            return clients == nil ? 0 : clients!.count
        }
        return deals == nil ? 0 : deals!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DealCellView", for: indexPath) as! DealCellView
        if ProfileState.sharedState.isTrader {
            cell.titleLabel.text = clients![indexPath.row].name
            cell.addressLabel.text = clients![indexPath.row].address
            cell.dateLAbel.text = ""
        }
        else {
            cell.titleLabel.text = deals![indexPath.row].title
            cell.addressLabel.text = deals![indexPath.row].address
            cell.dateLAbel.text = "from \(deals![indexPath.row].startDate!) to \(deals![indexPath.row].endDate!)"
        }
        
        return cell
    }
    
    
}
