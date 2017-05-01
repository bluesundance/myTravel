//
//  TravelGatewayDelegate.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation
public protocol TravelGatewayDelegate: class {

    func didGetTravelOptionsFromGateway(travelOptions: [TravelOption], forTravelMode: TravelMode)
}
