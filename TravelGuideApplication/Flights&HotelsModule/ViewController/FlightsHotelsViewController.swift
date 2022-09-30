//
//  FlightsHotelsViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import UIKit

class FlightsHotelsViewController: UIViewController {
    
    @IBOutlet weak var flightsHotelsTableView: UITableView!
    
    var viewModel = FlightsHotelsViewModel()
    var tableViewHelper:TableViewHelper?
    var selectedTitle:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedTitle
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        tableViewHelper = .init(tableView: flightsHotelsTableView, vc: self, itemsArray: viewModel.flightsHotelsModel.items, cellIdentifier: FlightsHotelsTableViewCell.identifier, isSearch: false)
    }


}
