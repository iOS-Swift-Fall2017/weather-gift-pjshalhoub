//
//  WeatherLocation.swift
//  Weather Gift
//
//  Created by PJ Shalhoub on 11/3/17.
//  Copyright © 2017 PJ Shalhoub. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var coordinates: String
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
    
}
