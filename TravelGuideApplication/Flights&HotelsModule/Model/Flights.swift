//
//  Flights.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

struct Flights:Decodable {
    var origin:String
    var destination: String
    var price: Int
    var airline: String
    var flight_number: Int
    var departure_at:String
}
