//
//  FlightsHotelsViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

protocol FlightsHotelsViewProtocol {
    func didFlightDataFetchDone(_ isSuccess:Bool)
}

class FlightsHotelsViewModel:FlightsHotelsProtocol {
    
    var viewModelDelegate:FlightsHotelsViewProtocol?
    
    
    var flightsHotelsModel = FlightsHotelsModel()
    
    
    func loadDataForHotels(){
        flightsHotelsModel.addMockDataForHotels()
    }
    
    func loadDataForHotelsWithNetwork() {
        flightsHotelsModel.getDataForFlights()
        flightsHotelsModel.delegate = self
    }
    
    func didFlightDataFetch(_ isSuccess: Bool) {
        if isSuccess {
            viewModelDelegate?.didFlightDataFetchDone(true)
        }
        else {
            viewModelDelegate?.didFlightDataFetchDone(false)
        }
    }
}
