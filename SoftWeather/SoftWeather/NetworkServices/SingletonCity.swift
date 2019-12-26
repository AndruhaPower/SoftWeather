//
//  SingletonCity.swift
//  SoftWeather
//
//  Created by Andrew on 23/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation


class SingletonCity {
    
    
    static let shared: SingletonCity = {
        let instance = SingletonCity()
        return instance
    }()
    
    var currentCity: CityModel?
}
