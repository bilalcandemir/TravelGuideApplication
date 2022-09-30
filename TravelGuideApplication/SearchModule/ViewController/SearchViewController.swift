//
//  SearchViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/27/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var hotelsSeperatorView: UIView!
    @IBOutlet weak var hotelsButtonLabel: UILabel!
    
    @IBOutlet weak var flightsImageView: UIImageView!
    @IBOutlet weak var flightsSeperatorView: UIView!
    @IBOutlet weak var flightsButtonLabel: UILabel!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var selectedSearchType = "HOTEL"
    var viewModel = SearchViewModel()
    var tableViewHelper:TableViewHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        viewModel.loadDataForHotels()
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        tableViewHelper = .init(tableView: mainTableView, vc: self, itemsArray: viewModel.searchModel.filteredArray, cellIdentifier: FlightsHotelsTableViewCell.identifier, isSearch: true)
        searchBarConfiguration()
    }
    
    // This screen's navigation bar doesen't show but in the second screen, navigation bar will be show
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
    }
    
    @IBAction func hotelsButtonPressed(_ sender: Any) {
        viewModel.loadDataForHotels()
        selectedSearchType = "HOTEL"
        searchTextField.placeholder = "Find Hotel"
        searchTextField.text = ""
        viewModel.findDataForHotels("")
        reloadTableViewData()
        setComponentsHotelsButtonPressed()
    }
    
    @IBAction func flightsButtonPressed(_ sender: Any) {
        viewModel.loadDataForFlights()
        selectedSearchType = "FLIGHTS"
        searchTextField.placeholder = "Find Flight"
        searchTextField.text = ""
        viewModel.findDataForFlights("")
        reloadTableViewData()
        setComponentsFlightsButtonPressed()
    }
}
