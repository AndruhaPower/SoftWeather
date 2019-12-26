//
//  WeatherServices.swift
//  SoftWeather
//
//  Created by Andrew on 19/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON


class WeatherServices {
    
    static let custom: Session = {
        let config = URLSessionConfiguration.default
        config.headers = .default
        config.timeoutIntervalForRequest = 20
        let manager = Alamofire.Session(configuration: config)
        return manager
    }()
    
    public func getCityList(inputQuery: String) {
        
        let url = Constants.urlForQuery
        
        let params: Parameters = ["query": inputQuery]
        
        WeatherServices.custom.request(url, method: .get, parameters: params).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var citiesArray: [CityModel] = []
                json.arrayValue.forEach({ (city) in
                    let city = CityModel(city: city)
                    citiesArray.append(city)
                })
                SingletonCity.shared.currentCity = citiesArray.first  //test не забыть убрать


            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    public func getWeatherForCity(completion: @escaping ([ForecastModel]) -> ()) {
        
        let currentCity = CityModel(title: "Moscow", woeid: 2122265, type: "City")
        
        let url = Constants.url+String(currentCity.woeid)
        
        WeatherServices.custom.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let cw = json["consolidated_weather"]
                var forecastArray: [ForecastModel] = []
                cw.arrayValue.forEach { (forecast) in
                    let forecast = ForecastModel(json: json, forecast: forecast)
                    forecastArray.append(forecast)
                }
                completion(forecastArray)
            case .failure(let error):
                print(error.localizedDescription)
        }
        }
    }
}
