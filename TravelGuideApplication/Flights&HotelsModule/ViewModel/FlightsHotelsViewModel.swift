//
//  FlightsHotelsViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

protocol FlightsHotelsViewProtocol {
    func didDataFetchDone(_ isSuccess:Bool)
}

class FlightsHotelsViewModel:FlightsHotelsProtocol {
    
    var viewModelDelegate:FlightsHotelsViewProtocol?
    
    
    var flightsHotelsModel = FlightsHotelsModel()
    
    
    func loadDataForHotelsWithNetwork(){
        flightsHotelsModel.getDataForHotels()
        flightsHotelsModel.delegate = self
    }
    
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
}
