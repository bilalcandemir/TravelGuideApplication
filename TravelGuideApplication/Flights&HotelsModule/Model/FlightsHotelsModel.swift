//
//  FlightsHotelsModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

protocol FlightsHotelsProtocol {
    func didFlightDataFetch(_ isSuccess:Bool)
}


class FlightsHotelsModel {
    
    var items:[Any] = []
    var delegate:FlightsHotelsProtocol?
    
    func addMockDataForHotels(){
        items.removeAll()
        
        var item = Hotels(hotelNumber: 1, hotelName: "Amsterdam", hotelDescription: "Amsterdam Hilton Hotel")
        items.append(item)
        
        item = Hotels(hotelNumber: 2, hotelName: "Frankfurt", hotelDescription: "Frankfurt Straßenbahn Hotel")
        items.append(item)
        
        item = Hotels(hotelNumber: 3, hotelName: "İstanbul", hotelDescription: "İstanbul Caprice Hotel")
        items.append(item)
    }
    
    func getDataForFlights(){
        let parameters:[String:Any] = ["calendar_type":"departure_date", "destination":"SAW", "origin":"BER", "depart_date":"2020-07"]
        
        NetworkManager(method: .get, headerType: .flights, parameters: parameters).request(responseType: Flights.self) { response in
            guard let response = response as? [Flights] else {
                self.delegate?.didFlightDataFetch(false)
                return
            }
            self.items = response
            self.delegate?.didFlightDataFetch(true)
        }
    }
    
    
}
