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
        
        let parameters:[String:Any] = ["calendar_type":"departure_date", "destination":"SAW", "origin":"BER", "depart_date":"2020-07"]
        
        NetworkManager(method: .get, headerType: .flights, parameters: parameters).request(responseType: Flights.self) { response in
            guard let response = response as? [Flights] else {
                //self.delegate?.didFlightDataFetch(false)
                return
            }
            self.items = response
            //self.delegate?.didFlightDataFetch(true)
        }
    }
    
    func filterForHotels(_ searchHotel:String){
        filteredArray.removeAll()
        if let hotelsArray = items as? [Hotels]{
            filteredArray = hotelsArray.filter({$0.hotelName.contains(searchHotel)})
        }
    }
    
    func filterForFlights(_ searchFlight:Int){
        filteredArray.removeAll()
        if let flightsArray = items as? [Flights]{
            //filteredArray = flightsArray.filter({$0.flightDescription.contains(searchFlight)})
            filteredArray = flightsArray.filter({$0.flight_number == searchFlight})
        }
    }
}
