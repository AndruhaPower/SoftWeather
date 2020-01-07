//
//  ForecastModel.swift
//  SoftWeather
//
//  Created by Andrew on 23/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ForecastModel {
    
    var parent: CityModel
    var date: String
    
    static let mbarToMMHG: Float = 0.775
    static let milesToKM: Float = 0.62
    static let mphToMps: Float = 0.44704
    
    var id: Int
    var minTemp: String
    var maxTemp: String
    var theTemp: String
    var windSpeed: String
    var windDirectionCompass: String
    var airPressure: String
    var humidity: String
    var visibility: String
    var predictability: String
    var weatherState: WeatherState

    init(json: JSON, forecast: JSON) {
        let parent = json["parent"]
        self.parent = CityModel(title: parent["title"].stringValue, woeid: parent["woeid"].intValue, type: parent["location_type"].stringValue)
        self.date = json["time"].stringValue
        self.id = forecast["id"].intValue
        self.weatherState = WeatherState(weatherAbbr: forecast["weather_state_abbr"].stringValue)
        self.minTemp = String(format: "%.1f", forecast["min_temp"].floatValue)
        self.maxTemp = String(format: "%.1f", forecast["max_temp"].floatValue)
        self.theTemp = String(Int(forecast["the_temp"].floatValue.rounded()))
        self.windSpeed = String(format: "%.1f", forecast["wind_speed"].floatValue * ForecastModel.mphToMps) + " м/c"
        self.windDirectionCompass = forecast["wind_direction_compass"].stringValue
        self.airPressure = String(forecast["air_pressure"].floatValue.rounded() * ForecastModel.mbarToMMHG) + " мм"
        self.humidity = String(forecast["humidity"].intValue) + " %"
        self.visibility = String((forecast["visibility"].floatValue / ForecastModel.milesToKM).rounded()) + " км"
        self.predictability = String(forecast["predictability"].intValue) + " %"
    }
}
