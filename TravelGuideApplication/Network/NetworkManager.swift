//
//  NetworkManager.swift
//  TravelGuideApplication
//
//  Created by Bilal Candemir on 10/1/22.
//

import Foundation
import Alamofire

enum HeaderType {
    case flights, hotels
}

class NetworkManager {
        
    private let flightsURL = "https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/v1/prices/calendar"
    private var flightsApiKey = "bd7453e481msh12f31a0dd0b9a0fp11e3a4jsn7510a05d0ca1"
    private var flightsApiToken = "0927c84aa0f2d2bc62266bbec7caccd7"
    private var flightsApiHost = "travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com"
    
    
    
    private var hotelsURL = "https://hotels4.p.rapidapi.com/properties/list"
    private var hotelsApiKey = "bd7453e481msh12f31a0dd0b9a0fp11e3a4jsn7510a05d0ca1"
    private var hotelsApiHost = "hotels4.p.rapidapi.com"
    
    
    typealias handler = (_ response: Any?) -> ()
    
    private var parameters:[String:Any]?
    private var method:HTTPMethod
    private var headerType:HeaderType
    
    var response:Any?
    
    var flightsArray:[Flights] = []
    
    init(method:HTTPMethod, headerType:HeaderType, parameters:[String: Any]?) {
        self.method = method
        self.parameters = parameters
        self.headerType = headerType
    }
    
    private func getHeaders(_ type:HeaderType) -> [String:String]{
        if type == .flights {
            return ["X-Access-Token":flightsApiToken, "X-RapidAPI-Key":flightsApiKey, "X-RapidAPI-Host":flightsApiHost]
        }
        else {
            return ["X-RapidAPI-Key":hotelsApiKey, "X-RapidAPI-Host":hotelsApiHost]
        }
    }
    
    func request<T:Decodable>(responseType:T.Type, complation: @escaping handler) {
        let flightHeader = getHeaders(.flights)
        
        AF.request(flightsURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(flightHeader)).response {data in
            
            guard let modifiedData = data.data else {return}
            
            do {
                guard let jsonResponse = try JSONSerialization.jsonObject(with: modifiedData) as? [String:Any] else {return}
                
                if let flyList = jsonResponse["data"] as? [String:Any] {
                    for flys in flyList {
                        
                        guard let dictionary = flys.value as? [String:Any] else {return}
                        guard let flightData = try? JSONSerialization.data(withJSONObject: dictionary, options: []) else {return}
                        
                        
                        let model = try JSONDecoder().decode(Flights.self, from: flightData)
                        self.flightsArray.append(model)
                        
                    }
                    complation(self.flightsArray)
                }
                
            }
            catch {
                print("error")
            }
        }
    }
    
    func requestForHotels<T:Decodable>(responseType:T.Type, complation: @escaping handler) {
        let hotelHeader = getHeaders(.hotels)
        
        AF.request(hotelsURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(hotelHeader)).response {data in
            
            
            guard let data = data.data else {return}
            
            do {
                let item = try JSONDecoder().decode(Welcome.self, from: data)
                
                let results = item.data.body.searchResults.results
                
                complation(results)
            }
            
            catch {
                print("error")
            }
            
        }
    }
    
}
