//
//  ListTrainsTravelOptionsPresenter.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation

public class ListTrainsTravelOptionsPresenter: ListTravelOptionsInteractorDelegate, ListTravelOptionsPresenterProtocol {

    var interactor: ListTravelOptionsInteractorProtocol

    public weak var delegate: ListTravelOptionsPresenterDelegate?

    public var travelOptions: [Any] = [Any]()

    public var currentSortOrder = TimeOptionsSortOrder.departureTime.rawValue

    init(interactor: ListTravelOptionsInteractorProtocol) {
        self.interactor = interactor
        self.interactor.delegate = self
    }

    public func getTravelOptions() {
        interactor.doListTravelOptions(travelMode: .train)
    }

    public func didGetTravelOptions(travelOptions options: [TravelOption], forTravelMode mode: TravelMode) {
        self.travelOptions = options

        sortCurrentTimeOptions(currentSortOrder)

        DispatchQueue.main.async(execute: {
            self.delegate?.didGetTravelOptions(withTravelOptions: options)
        })
        
    }

    public func sortCurrentTimeOptions(_ sortOrder: TimeOptionsSortOrder.RawValue) {

        self.currentSortOrder = sortOrder

        guard self.travelOptions.count > 0, let myTravelOptions = self.travelOptions as? [TravelOption] else {
            return
        }

        switch currentSortOrder {
        case  TimeOptionsSortOrder.departureTime.rawValue:
            self.travelOptions = myTravelOptions.sorted {

                guard let departure1 = $0.departureTime.toMyCustomFormattedDate(),
                    let departure2 = $1.departureTime.toMyCustomFormattedDate() else {
                        return false
                }

                return departure1 < departure2
            }
        case TimeOptionsSortOrder.arrivalTime.rawValue:
            self.travelOptions = myTravelOptions.sorted {

                guard let arrival1 = $0.arrivalTime.toMyCustomFormattedDate(),
                    let arrival2 = $1.arrivalTime.toMyCustomFormattedDate() else {
                        return false
                }

                return arrival1 < arrival2
            }
        default:
            break
            
        }
    }
}
