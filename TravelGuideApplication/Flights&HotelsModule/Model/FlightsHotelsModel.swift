//
//  FlightsHotelsModel.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

protocol FlightsHotelsProtocol {
    func didDataFetch(_ isSuccess:Bool)
}


class FlightsHotelsModel {
    
    var items:[Any] = []
    var delegate:FlightsHotelsProtocol?
    
    func getDataForFlights(){
        let parameters:[String:Any] = ["calendar_type":"departure_date", "destination":"SAW", "origin":"BER", "depart_date":"2020-07"]
        
        NetworkManager(method: .get, headerType: .flights, parameters: parameters).request(responseType: Flights.self) { response in
            guard let response = response as? [Flights] else {
                self.delegate?.didDataFetch(false)
                return
            }
            self.items = response
            self.delegate?.didDataFetch(true)
        }
    }
    
    func getDataForHotels(){
        let parameters:[String:Any] = ["destinationId":"1506246", "pageNumber":"1", "pageSize":"25", "checkIn":"2022-10-20", "checkOut":"2022-10-30", "adults1":"1", "sortOrder":"PRICE", "locale":"en_US", "currency":"USD"]
        
        NetworkManager(method: .get, headerType: .hotels, parameters: parameters).requestForHotels(responseType: [Result].self) { response in
            guard let hotelsArray = response as? [Result] else {
                self.delegate?.didDataFetch(false)
                return
                
            }
            
            self.items = self.getHotelsCellModel(hotelsArray)
            self.delegate?.didDataFetch(true)
        }
    }
    
    func getHotelsCellModel(_ hotels:[Result]) -> [HotelsCellModel] {
        //return hotels.map{.init(hotelName: $0.name, hotelId: $0.id, hotelRating: $0.starRating)}
        return hotels.map({.init(hotelName: $0.name, hotelId: $0.id, hotelRating: $0.starRating, hotelAddress: $0.address.streetAddress, hotelPrice: $0.ratePlan.price.current, hotelImageURL: $0.optimizedThumbUrls.srpDesktop)})
    }
    
    
}
