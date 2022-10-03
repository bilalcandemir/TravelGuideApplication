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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.tableViewHelper?.itemsArray = self.viewModel.searchModel.filteredArray
            self.tableViewHelper?.tableView?.reloadData()
        })
    }
    
    func reloadTableViewData(){
        DispatchQueue.main.async {
            self.tableViewHelper?.itemsArray = self.viewModel.searchModel.filteredArray
            self.tableViewHelper?.tableView?.reloadData()
        }
    }
    
    
    @objc func textFieldDidChange() {
        if searchTextField.text!.count > 2 {
            if selectedSearchType == "HOTEL" {
                if let text = searchTextField.text {
                    viewModel.searchModel.filterForHotels(text)
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
                viewModel.searchModel.filterForHotels("")
                reloadTableViewData()
            }
            
            else {
                viewModel.findDataForFlights(0)
                reloadTableViewData()
            }
        }
    }
}
