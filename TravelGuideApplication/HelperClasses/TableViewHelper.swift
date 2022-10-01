//
//  TableViewHelper.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/27/22.
//

import Foundation
import UIKit
class TableViewHelper:NSObject {
    // We have a table view, view controller, items array is defined any because we created table view cell different 2 view controllers and also we have a cell identifier because we will use 2 different custom table view cell
    var tableView:UITableView?
    var viewController:UIViewController?
    var itemsArray:[Any] = []
    var cellIdentifier:String?
    var isSearch:Bool!
    
    // Use init when create a new table view
    init(tableView: UITableView, vc: UIViewController, itemsArray: [Any], cellIdentifier: String, isSearch:Bool){
        super.init()
        self.tableView = tableView
        self.viewController = vc
        self.itemsArray = itemsArray
        self.cellIdentifier = cellIdentifier
        self.isSearch = isSearch
        configureTableView(cellIdentifier)
    }
    
    // Table view configuration when user wants to create table view cell with custom cells
    private func configureTableView(_ identifier:String) {
        tableView?.separatorColor = UIColor.white
        tableView?.register(.init(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
}


extension TableViewHelper:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Give the items array count
        return itemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if itemsArray.isEmpty {
            let cell = UITableViewCell()
            return cell
        }
        
        //Casting process for understand which array come from view model and create the custom cell
        if let flightsArray = itemsArray as? [Flights] {
            let cell = tableView.dequeueReusableCell(withIdentifier: FlightsHotelsTableViewCell.identifier) as! FlightsHotelsTableViewCell
            cell.setFlightsData(flightsArray[indexPath.row], isSearch)
            return cell
        }
        
        //Casting process for understand which array come from view model and create the custom cell
        if let hotelsArray = itemsArray as? [Hotels] {
            let cell = tableView.dequeueReusableCell(withIdentifier: FlightsHotelsTableViewCell.identifier) as! FlightsHotelsTableViewCell
            cell.setHotelsData(hotelsArray[indexPath.row], isSearch)
            return cell
        }
        
        if let bookmarksArray = itemsArray as? [Bookmark] {
            let cell = tableView.dequeueReusableCell(withIdentifier: FlightsHotelsTableViewCell.identifier) as! FlightsHotelsTableViewCell
            cell.setBookmarksData(bookmarksArray[indexPath.row], isSearch)
            return cell
        }
        
        
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Check the items array, we just use did select row at func at to Do View controller
//        if let toDoListArray = itemsArray as? [ToDoListItem] {
//            // Prepare process for navigate to detail view controller
//            let storyboard = UIStoryboard(name: "ToDoStoryboard", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "ToDoDetailViewController") as! ToDoDetailViewController
//
//            // Give the object id for find which item come. If you want you can also this situation with just change the label and body values inside the class but i don't want it this is more complex
//            vc.listItemId = toDoListArray[indexPath.row].objectID
//            vc.delegate = viewController.self as? toDoViewControllerProtocol
//
//            // Go to detail view controller
//            self.viewController?.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}


