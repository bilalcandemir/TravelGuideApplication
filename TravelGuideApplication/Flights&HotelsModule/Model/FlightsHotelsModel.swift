//
//  FlightsHotelsModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

class FlightsHotelsModel {
    
    var items:[Any] = []
    
    func addMockDataForFlights(){
        items.removeAll()
        
        var item = Flights(flightNumber: 1, flightName: "TC-421", flightDescription: "İstanbul - New York")
        items.append(item)
        
        item = Flights(flightNumber: 2, flightName: "TC-761", flightDescription: "Dalaman - Dubai")
        items.append(item)
        
        item = Flights(flightNumber: 3, flightName: "TC-547", flightDescription: "Frankfurt - Amsterdam")
        items.append(item)
    }
    
    func addMockDataForHotels(){
        items.removeAll()
        
        var item = Hotels(hotelNumber: 1, hotelName: "Amsterdam", hotelDescription: "Amsterdam Hilton Hotel")
        items.append(item)
        
        item = Hotels(hotelNumber: 2, hotelName: "Frankfurt", hotelDescription: "Frankfurt Straßenbahn Hotel")
        items.append(item)
        
        item = Hotels(hotelNumber: 3, hotelName: "İstanbul", hotelDescription: "İstanbul Caprice Hotel")
        items.append(item)
    }
}
