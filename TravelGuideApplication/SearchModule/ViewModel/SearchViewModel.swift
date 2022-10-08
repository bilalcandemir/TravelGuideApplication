//
//  SearchViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/29/22.
//

import Foundation

class SearchViewModel {
    var searchModel = SearchModel()
    
    func loadDataForFlights(){
        searchModel.loadDataForFlights()
    }
    
    func loadDataForHotels(){
        searchModel.loadDataForHotels()
    }
    
    func findDataForHotels(_ searchHotelText:String){
        searchModel.filterForHotels(searchHotelText)
    }
    
    func findDataForFlights(_ searchFlightText:Int){
        searchModel.filterForFlights(searchFlightText)
    }
    
    func returnSearchData() -> [Any]{
        return searchModel.filteredArray
    }
}
