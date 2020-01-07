//
//  WeatherState.swift
//  SoftWeather
//
//  Created by Andrew on 29/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation

enum WeatherState {
    case snow
    case sleet
    case hail
    case thunderstrom
    case heavyRain
    case lightRain
    case showers
    case heavyCloud
    case lightCloud
    case clear
    case undetermined
    
    var title: String  {
        switch self {
        case .clear: return "Ясно"
        case .hail: return "Град"
        case .heavyCloud: return "Сильная облачность"
        case .heavyRain: return "Сильный дождь"
        case .lightCloud: return "Небольшие облака"
        case .lightRain: return "Небольшой дождь"
        case .showers: return "Ливень"
        case .sleet: return "Дождь со снегом"
        case .snow: return "Снег"
        case .thunderstrom: return "Гроза"
        case .undetermined: return "НЕ ОПРЕДЕЛЕНО"
        }
    }
    
    init(weatherAbbr: String) {
        switch weatherAbbr {
        case "sn": self = .snow
        case "sl": self = .sleet
        case "h": self = .hail
        case "t": self = .thunderstrom
        case "hr": self = .heavyRain
        case "lr": self = .lightRain
        case "s": self = .showers
        case "hc": self = .heavyCloud
        case "lc": self = .lightCloud
        case "c": self = .clear
        default: self = .undetermined
        }
    }
}
