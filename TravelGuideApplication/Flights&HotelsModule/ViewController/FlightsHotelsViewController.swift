//
//  FlightsHotelsViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import UIKit

class FlightsHotelsViewController: UIViewController, FlightsHotelsViewProtocol {
    
    
    
    
    @IBOutlet weak var flightsHotelsTableView: UITableView!
    
    var viewModel = FlightsHotelsViewModel()
    var tableViewHelper:TableViewHelper?
    var selectedTitle:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedTitle
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        viewModel.viewModelDelegate = self
        tableViewHelper = .init(tableView: flightsHotelsTableView, vc: self, itemsArray: [], cellIdentifier: FlightsHotelsTableViewCell.identifier, isSearch: false)
    }
    
    func didDataFetchDone(_ isSuccess: Bool) {
        if isSuccess {
            
            DispatchQueue.main.async {
                self.tableViewHelper?.itemsArray = self.viewModel.flightsHotelsModel.items
                self.tableViewHelper?.tableView?.reloadData()
            }
        }
    }
}


