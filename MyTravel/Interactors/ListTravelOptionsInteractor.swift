//
//  GetTravelOptionsInteractor.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation

public class ListTravelOptionsInteractor: ListTravelOptionsInteractorProtocol, TravelGatewayDelegate {

    public weak var delegate: ListTravelOptionsInteractorDelegate?

    var travelGateway: TravelGateway

    init(travelGateway: TravelGateway) {
        self.travelGateway = travelGateway
        self.travelGateway.delegate = self
    }

    public func doListTravelOptions(travelMode mode: TravelMode) {
        self.travelGateway.getTravelOptions(travelMode: mode)
    }

    public func didGetTravelOptionsFromGateway(travelOptions options: [TravelOption], forTravelMode mode: TravelMode) {
        self.delegate?.didGetTravelOptions(travelOptions: options, forTravelMode: mode)
    }
}
