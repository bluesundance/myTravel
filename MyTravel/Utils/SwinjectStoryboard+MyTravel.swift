//
//  SwinjectStoryboard+MyTravel.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {

    static func setup() {

        self.registerGateways(container: defaultContainer)
        self.registerInteractors(container: defaultContainer)
        self.registerViewControllersAndPresenters(container: defaultContainer)
    }

    static func registerGateways(container: Container) {

        container.register(TravelGateway.self) { _ in
            return SimpleTravelGateway()
            }
    }

    static func registerInteractors(container: Container) {

        container.register(ListTravelOptionsInteractorProtocol.self) {resolver  in
            return ListTravelOptionsInteractor(travelGateway: resolver.resolve(TravelGateway.self)!)
        }
    }

    static func registerViewControllersAndPresenters(container: Container) {

        container.storyboardInitCompleted(UITabBarController.self, initCompleted: { _ in })
        container.storyboardInitCompleted(UINavigationController.self, initCompleted: { _ in })

        container.storyboardInitCompleted(TrainsListTableViewController.self, initCompleted: { resolver, component in
            component.presenter =
                ListTrainsTravelOptionsPresenter(
                    interactor: resolver.resolve(ListTravelOptionsInteractorProtocol.self)!)
        })

        container.storyboardInitCompleted(FlightsListTableViewController.self, initCompleted: { resolver, component in
            component.presenter =
                ListFlightsTravelOptionsPresenter(
                    interactor: resolver.resolve(ListTravelOptionsInteractorProtocol.self)!)
        })

        container.storyboardInitCompleted(BusesListTableViewController.self, initCompleted: { resolver, component in
            component.presenter =
                ListBusesTravelOptionsPresenter(
                    interactor: resolver.resolve(ListTravelOptionsInteractorProtocol.self)!)
        })
    }
}
