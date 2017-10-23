//
//  WeatherLocation.swift
//  Weather Gift
//
//  Created by PJ Shalhoub on 10/20/17.
//  Copyright © 2017 PJ Shalhoub. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var currentSummary = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        //print(weatherURL)
        
        Alamofire.request(weatherURL).responseJSON { response in
            //print(response)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return a temperature")
                }
                if let weatherSummary = json["daily"]["summary"].string {
                    self.currentSummary = weatherSummary
                } else {
                    print("Could not return a summary")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
        
    }
}
