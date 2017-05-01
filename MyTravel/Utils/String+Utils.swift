//
//  String+Utils.swift
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

import Foundation

extension String {

    func toMyCustomFormattedDate() -> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="HH:mm"

        return dateFormatter.date(from: self)
    }
}

extension Int {
    func format(pattern: String) -> String {
        return String(format: "%\(pattern)d", self)
    }
}

extension Double {
    func format(pattern: String) -> String {
        return String(format: "%\(pattern)f", self)
    }
}
