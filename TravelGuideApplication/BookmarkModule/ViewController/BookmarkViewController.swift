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
        viewModel.loadData()
        tableViewHelper = .init(tableView: mainTableView, vc: self, itemsArray: viewModel.bookmarkModel.bookMarkArray, cellIdentifier: FlightsHotelsTableViewCell.identifier, isSearch: false)
    }

}
