//
//  TravelGateway.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation

public protocol TravelGateway {

    weak var delegate: TravelGatewayDelegate? { get set }
                       
    func getTravelOptions(travelMode: TravelMode)
}

@objc
public enum TravelMode: NSInteger {

    case train
    case flight
    case bus
}
