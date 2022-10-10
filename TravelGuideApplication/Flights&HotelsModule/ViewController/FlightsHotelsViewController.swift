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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        viewModel.viewModelDelegate = self
        tableViewHelper = .init(tableView: flightsHotelsTableView, vc: self, itemsArray: [], cellIdentifier: FlightsHotelsTableViewCell.identifier, isSearch: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // When data fetch process done this function gives the items to table view helper
    func didDataFetchDone(_ isSuccess: Bool) {
        if isSuccess {
            DispatchQueue.main.async {
                self.tableViewHelper?.itemsArray = self.viewModel.returnData()
                self.tableViewHelper?.tableView?.reloadData()
            }
        }
    }
}


