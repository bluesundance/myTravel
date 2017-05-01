//
//  SimpleTravelGateway.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class SimpleTravelGateway: TravelGateway {

    public weak var delegate: TravelGatewayDelegate?

    public func getTravelOptions(travelMode: TravelMode) {

        switch travelMode {
        case .train:
            getTrainTravelOptions()
        case .flight:
            getFlightTravelOptions()
        case .bus:
            getBusTravelOptions()
        }
    }

    private func getTrainTravelOptions() {

        Alamofire.request(TravelApiRouter.listTrains(parameters: nil)).responseString { response in

            switch response.result {
            case .success:
                print("Successfull: \(response.result)")

                let json = JSON(response.data!)
                guard let myTravelOptions = json.array?.map({ return TravelOption(json: $0) }) else {
                    self.delegate?.didGetTravelOptionsFromGateway(travelOptions: [TravelOption](),
                                                                  forTravelMode: TravelMode.train)
                    return
                }
                self.delegate?.didGetTravelOptionsFromGateway(travelOptions: myTravelOptions,
                                                              forTravelMode: TravelMode.train)

            case .failure(let error):
                print (error)
            }
        }
    }

    private func getFlightTravelOptions() {

        Alamofire.request(TravelApiRouter.listFlights(parameters: nil)).responseString { response in

            switch response.result {
            case .success:
                print("Successfull: \(response.result)")

                let json = JSON(response.data!)
                guard let myTravelOptions = json.array?.map({ return TravelOption(json: $0) }) else {
                    self.delegate?.didGetTravelOptionsFromGateway(travelOptions: [TravelOption](),
                                                                  forTravelMode: TravelMode.flight)
                    return
                }
                self.delegate?.didGetTravelOptionsFromGateway(travelOptions: myTravelOptions,
                                                              forTravelMode: TravelMode.flight)

            case .failure(let error):
                print (error)
            }
        }
    }

    private func getBusTravelOptions() {

        Alamofire.request(TravelApiRouter.listBuses(parameters: nil)).responseString { response in

            switch response.result {
            case .success:
                print("Successfull: \(response.result)")

                let json = JSON(response.data!)
                guard let myTravelOptions = json.array?.map({ return TravelOption(json: $0) }) else {
                    self.delegate?.didGetTravelOptionsFromGateway(travelOptions: [TravelOption](),
                                                                  forTravelMode: TravelMode.bus)
                    return
                }
                self.delegate?.didGetTravelOptionsFromGateway(travelOptions: myTravelOptions,
                                                              forTravelMode: TravelMode.bus)
                
            case .failure(let error):
                print (error)
            }
        }
    }
}
