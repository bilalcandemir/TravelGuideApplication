//
//  SearchViewControllerExtension.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/29/22.
//

import Foundation
import UIKit



extension SearchViewController {
    func setComponentsHotelsButtonPressed(){
        hotelsSeperatorView.isHidden = false
        flightsSeperatorView.isHidden = true
        
        hotelsButtonLabel.textColor = UIColor(named: "searchSelectedTypeColor")
        flightsButtonLabel.textColor = UIColor.gray
        
        
        flightsImageView.image = UIImage(named: "grayFlightsIcon")
        hotelImageView.image = UIImage(named: "redHotelsIcon")
    }
    
    func setComponentsFlightsButtonPressed(){
        flightsSeperatorView.isHidden = false
        hotelsSeperatorView.isHidden = true
        
        hotelsButtonLabel.textColor = UIColor.gray
        flightsButtonLabel.textColor = UIColor(named: "searchSelectedTypeColor")
        
        
        flightsImageView.image = UIImage(named: "redFlightsIcon")
        hotelImageView.image = UIImage(named: "grayHotelsIcon")
    }
    
    func searchBarConfiguration(){
        
//        let noDataView = UIView(frame: CGRect(x: mainTableView.frame.midX, y: mainTableView.frame.midY, width: mainTableView.frame.width, height: mainTableView.frame.height))
//        let noDataImageView = UIImageView(image: UIImage(named: "noDataIcon"))
//        noDataView.frame = CGRect(x: noDataView.frame.midX, y: noDataView.frame.midY, width: 60, height: 60)
//        noDataView.addSubview(noDataImageView)
//        mainTableView.backgroundView = noDataView
        
        
        
        flightsSeperatorView.isHidden = true
        hotelsSeperatorView.isHidden = false
        
        hotelsButtonLabel.textColor = UIColor(named: "searchSelectedTypeColor")
        flightsButtonLabel.textColor = UIColor.gray
        
        searchTextField.placeholder = "Find Hotel"
        searchTextField.font = UIFont.systemFont(ofSize: 14)
        searchTextField.textColor = UIColor(named: "searchTextFieldColor")
        
        flightsImageView.image = UIImage(named: "grayFlightsIcon")
        hotelImageView.image = UIImage(named: "redHotelsIcon")
        
        searchBarView.layer.borderWidth = 1.8
        searchBarView.layer.borderColor = UIColor(named: "searchBarBorderColor")?.cgColor
        searchBarView.layer.cornerRadius = 4
        
    }
    
    func reloadTableViewDataWithDelay(){
        let data = viewModel.returnSearchData()
        
        if data.isEmpty {
            mainTableView.isHidden = true
        }
        else {
            mainTableView.isHidden = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.tableViewHelper?.itemsArray = data
            self.tableViewHelper?.tableView?.reloadData()
        })
    }
    
    func reloadTableViewData(){
        DispatchQueue.main.async {
            self.tableViewHelper?.itemsArray = self.viewModel.returnSearchData()
            self.tableViewHelper?.tableView?.reloadData()
        }
    }
    
    
    @objc func textFieldDidChange() {
        if searchTextField.text!.count > 2 {
            if selectedSearchType == "HOTEL" {
                if let text = searchTextField.text {
                    viewModel.findDataForHotels(text)
                    reloadTableViewDataWithDelay()
                }
            }
            
            else {
                if let text = searchTextField.text {
                    if let searchNumber = Int(text) {
                        viewModel.findDataForFlights(searchNumber)
                    }
                    reloadTableViewDataWithDelay()
                }
            }
        }
        else {
            
            if selectedSearchType == "HOTEL" {
                viewModel.findDataForHotels("")
                reloadTableViewData()
            }
            
            else {
                viewModel.findDataForFlights(0)
                reloadTableViewData()
            }
        }
    }
}
