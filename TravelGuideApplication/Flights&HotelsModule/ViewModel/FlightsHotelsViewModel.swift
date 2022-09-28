//
//  FlightsHotelsViewModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

class FlightsHotelsViewModel {
    
    var flightsHotelsModel = FlightsHotelsModel()
    
    func loadDataForFlights(){
        flightsHotelsModel.addMockDataForFlights()
    }
    
    func loadDataForHotels(){
        flightsHotelsModel.addMockDataForHotels()
    }
}
