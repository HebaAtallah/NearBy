//
//  NearByEndPoint.swift
//  NearBy
//
//  Created by Heba on 4/16/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation
import Moya

enum NearByEndPoint: TargetType {
    
    case nearByPlaces(latitude: Double, longitude: Double)
    case photos(venueID: String)
    
    var baseURL: URL {
        return URL(string: "https://api.foursquare.com/v2")!
    }
    
    var path: String {
        switch self {
        case .nearByPlaces:
            return "/venues/explore"
        case .photos(let venueID):
            return "/venues/\(venueID)/photos"
        }
    }
    
    var sampleData: Data {
        switch self {
        case .nearByPlaces:
            return stubbedResponse("places")
        case .photos:
            return stubbedResponse("photos")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .nearByPlaces, .photos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .nearByPlaces(latitude, longitude):
            let parameters = placesRequestParameters(latitude: latitude, longitude: longitude)
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.queryString)
            
        case .photos:
            let parameters = photosRequestParameters()
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    private func placesRequestParameters(latitude: Double, longitude: Double) -> [String: Any] {
        return [
            "radius": 1000,
            "v": "20160607",
            "limit": 10,
            "ll": String(format: "%f,%f", latitude, longitude),
            "client_id": ServiceInfo.clientId.info,
            "client_secret": ServiceInfo.clientSecret.info]
    }
    
    private func photosRequestParameters() -> [String: Any] {
        return [
            "v": "20160607",
            "client_id": ServiceInfo.clientId.info,
            "client_secret": ServiceInfo.clientSecret.info]
    }
    
    private func stubbedResponse(_ filename: String) -> Data! {
        let url = Bundle.main.url(forResource: filename, withExtension: "json")
        return (try? Data(contentsOf: url!))
    }
}
