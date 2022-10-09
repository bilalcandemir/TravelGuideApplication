//
//  BookmarkViewController.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/27/22.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var tableViewHelper:TableViewHelper?
    var viewModel = BookmarkViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        viewModel.loadData()
        tableViewHelper = .init(tableView: mainTableView, vc: self, itemsArray: viewModel.returnBookmarkData(), cellIdentifier: FlightsHotelsTableViewCell.identifier, isSearch: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        viewModel.loadData()
        tableViewHelper?.itemsArray = viewModel.returnBookmarkData()
        tableViewHelper?.tableView?.reloadData()
    }

}
