//
//  TravelApiRouter.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation
import Alamofire

public enum TravelApiRouter: URLRequestConvertible {

    static let baseUrl = "https://api.myjson.com/bins"

    case listTrains(parameters: Parameters?)
    case listFlights(parameters: Parameters?)
    case listBuses(parameters: Parameters?)

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .listTrains:
            return "/3zmcy"
        case .listFlights:
            return "/w60i"
        case .listBuses:
            return "/37yzm"
        }

    }

    public func asURLRequest() throws -> URLRequest {

        let url = try TravelApiRouter.baseUrl.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .listTrains(let parameters),
             .listFlights(parameters: let parameters),
             .listBuses(parameters: let parameters):

            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
