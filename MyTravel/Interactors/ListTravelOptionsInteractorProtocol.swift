//
//  GetTravelOptionsInteractorProtocol.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation
public protocol ListTravelOptionsInteractorProtocol {

    weak var delegate: ListTravelOptionsInteractorDelegate? { get set }

    func doListTravelOptions(travelMode mode: TravelMode)
}
