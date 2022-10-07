//
//  Hotels.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 9/28/22.
//

import Foundation

struct HotelsCellModel{
    var hotelName:String
    var hotelId:Int
    var hotelRating:Double
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - Welcome
struct Welcome: Decodable {
    let result: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let body: Body
}

// MARK: - Body
struct Body: Decodable {
    let header: String
    let searchResults: SearchResults
}

struct SearchResults: Decodable {
    let totalCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let id: Int
    let name: String
    let starRating: Double
    let address: Address
    let ratePlan: RatePlan
}

struct Address: Decodable {
    let streetAddress: String
    let locality, postalCode: String
    let region: String
    let countryName: String
}

struct RatePlan: Codable {
    let price: RatePlanPrice
}

struct RatePlanPrice: Codable {
    let current: String
    let exactCurrent: Double
    let info: String
    let additionalInfo: String
}
