//
//  Location.swift
//  CICDDemo
//
//  Created by DEFTeam on 02/08/20.
//  Copyright © 2020 com.defteam.com. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let latitude: Double
    let longitude: Double
    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name && lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
