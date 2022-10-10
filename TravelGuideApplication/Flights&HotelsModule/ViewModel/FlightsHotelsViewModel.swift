//
//  FlightsHotelsViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation
// Protocol will call when data fetch done to view controller
protocol FlightsHotelsViewProtocol {
    func didDataFetchDone(_ isSuccess:Bool)
}

class FlightsHotelsViewModel:FlightsHotelsProtocol {
    
    var viewModelDelegate:FlightsHotelsViewProtocol?
    var flightsHotelsModel = FlightsHotelsModel()
    // Call the Model for fetch hotel data
    func loadDataForHotelsWithNetwork(){
        flightsHotelsModel.getDataForHotels()
        flightsHotelsModel.delegate = self
    }
    // Call the Model for fetch flight data
    func loadDataForFlightsWithNetwork() {
        flightsHotelsModel.getDataForFlights()
        flightsHotelsModel.delegate = self
    }
    
    func didDataFetch(_ isSuccess: Bool) {
        if isSuccess {
            viewModelDelegate?.didDataFetchDone(true)
        }
        else {
            viewModelDelegate?.didDataFetchDone(false)
        }
    }
    
    func returnData() -> [Any] {
        return flightsHotelsModel.items
    }
}
