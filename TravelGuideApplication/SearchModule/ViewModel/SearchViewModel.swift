//
//  SearchViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/29/22.
//

import Foundation

class SearchViewModel {
    
    var searchModel = SearchModel()
    
    // When user tap the flights button
    func loadDataForFlights(){
        searchModel.loadDataForFlights()
    }
    
    // When user tap the Hotels button
    func loadDataForHotels(){
        searchModel.loadDataForHotels()
    }
    
    // Search hotel data with text field text
    func findDataForHotels(_ searchHotelText:String){
        searchModel.filterForHotels(searchHotelText)
    }
    // Search flight data with text field text
    func findDataForFlights(_ searchFlightText:Int){
        searchModel.filterForFlights(searchFlightText)
    }
    
    //Return filtered data to view controller 
    func returnSearchData() -> [Any]{
        return searchModel.filteredArray
    }
}
