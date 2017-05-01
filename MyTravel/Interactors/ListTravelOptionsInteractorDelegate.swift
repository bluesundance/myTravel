//
//  GetTravelOptionsInteractorDelegate.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation
public protocol ListTravelOptionsInteractorDelegate: class {

    func didGetTravelOptions(travelOptions: [TravelOption], forTravelMode: TravelMode)
}
