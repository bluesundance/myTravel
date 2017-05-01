//
//  TravelOption.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation
import SwiftyJSON

public class TravelOption: NSObject {

    var identifier = ""
    var providerLogoUrl = ""
    private var priceInEurosUnformatted = ""
    var departureTime = ""
    var arrivalTime = ""
    var numberOfStops = 0
    
    var duration: String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="HH:mm"

        let departureDate = dateFormatter.date(from: self.departureTime)
        let arrivalDate = dateFormatter.date(from: self.arrivalTime)

        guard let departure = departureDate, let arrival = arrivalDate else {
            return ""
        }

        let timeInterval = NSInteger(arrival.timeIntervalSince(departure))

        let minutes = (timeInterval / 60) % 60
        let hours = (timeInterval / 3600)

        if hours >= 1 {
            return "\(hours):\(minutes)h"
        } else {
            return "\(minutes)m"
        }
    }

    var priceInEuros: String {

        let doubleRep = Double(self.priceInEurosUnformatted)

        if let double = doubleRep {
            return double.format(pattern: ".2")
        } else {
            return self.priceInEurosUnformatted
        }
    }

    public convenience required init(json: JSON) {
        self.init()

        self.identifier = json["id"].stringValue
        self.providerLogoUrl = json["provider_logo"].stringValue
        self.priceInEurosUnformatted = json["price_in_euros"].stringValue
        self.departureTime = json["departure_time"].stringValue
        self.arrivalTime = json["arrival_time"].stringValue
        self.numberOfStops = json["number_of_stops"].intValue
    }
}

@objc
public enum TimeOptionsSortOrder: Int {

    case arrivalTime = 1
    case departureTime = 2
}
