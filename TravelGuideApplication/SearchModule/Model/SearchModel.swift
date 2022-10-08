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
    
    func loadDataForHotels(){
        let parameters:[String:Any] = ["destinationId":"1506246", "pageNumber":"1", "pageSize":"25", "checkIn":"2022-10-20", "checkOut":"2022-10-30", "adults1":"1", "sortOrder":"PRICE", "locale":"en_US", "currency":"USD"]
        
        NetworkManager(method: .get, headerType: .hotels, parameters: parameters).requestForHotels(responseType: [Result].self) { response in
            guard let hotelsArray = response as? [Result] else {
                return
            }
            self.items = self.convertHotelCellModel(hotelsArray)
        }
    }
    
    func convertHotelCellModel(_ item:[Result]) -> [HotelsCellModel] {
        return item.map({.init(hotelName: $0.name, hotelId: $0.id, hotelRating: $0.starRating, hotelAddress: $0.address.streetAddress, hotelPrice: $0.ratePlan.price.current, hotelImageURL: $0.optimizedThumbUrls.srpDesktop)})
    }
    
    func filterForHotels(_ searchHotel:String){
        filteredArray.removeAll()
        if let hotelsArray = items as? [HotelsCellModel]{
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
