//
//  CityModel.swift
//  SoftWeather
//
//  Created by Andrew on 19/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation
import SwiftyJSON


struct CityModel: CustomStringConvertible {
    
    var title: String
    var woeid: Int
    var type: String
    
    var description: String {
        let desc: String = "\nLocation: \(self.title), WOEID: \(self.woeid), Type: \(self.type)"
        return desc
    }
    
    init(city: JSON) {
        self.title = city["title"].stringValue
        self.woeid = city["woeid"].intValue
        self.type = city["location_type"].stringValue
    }
    
    init(title: String, woeid: Int, type: String) {
        self.title = title
        self.woeid = woeid
        self.type = type
    }
}

