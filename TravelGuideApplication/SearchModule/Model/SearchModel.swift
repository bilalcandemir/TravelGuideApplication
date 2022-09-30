//
//  SearchModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/29/22.
//

import Foundation

class SearchModel {
    
    var items:[Any] = []
    var filteredArray:[Any] = []
    
    func loadDataForHotels(){
        items.removeAll()
        var item = Hotels(hotelNumber: 1, hotelName: "Frankfurt", hotelDescription: "Frankfurt Straßenbahn Hotel")
        items.append(item)
        
        item = Hotels(hotelNumber: 2, hotelName: "Amsterdam", hotelDescription: "Amsterdam Den Haag Hotel")
        items.append(item)
        
        item = Hotels(hotelNumber: 3, hotelName: "İstanbul", hotelDescription: "İstanbul Hilton Hotel")
        items.append(item)
        
    }
    
    func loadDataForFlights(){
        items.removeAll()
        var item = Flights(flightNumber: 1, flightName: "TC-432", flightDescription: "İstanbul - Roterdam")
        items.append(item)
        
        item = Flights(flightNumber: 2, flightName: "TC-712", flightDescription: "Berlin - Kocaeli")
        items.append(item)
        
        item = Flights(flightNumber: 3, flightName: "TC-232", flightDescription: "Trabzon - Madrid")
        items.append(item)
    }
    
    func filterForHotels(_ searchHotel:String){
        filteredArray.removeAll()
        if let hotelsArray = items as? [Hotels]{
            filteredArray = hotelsArray.filter({$0.hotelName.contains(searchHotel)})
        }
        
        print("Hotels: \(filteredArray)")
    }
    
    func filterForFlights(_ searchFlight:String){
        filteredArray.removeAll()
        if let flightsArray = items as? [Flights]{
            filteredArray = flightsArray.filter({$0.flightDescription.contains(searchFlight)})
        }
        print("Flights: \(filteredArray)")
    }
}
