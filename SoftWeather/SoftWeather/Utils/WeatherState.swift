//
//  WeatherState.swift
//  SoftWeather
//
//  Created by Andrew on 29/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

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
    
    var backgroundURL: String {
        switch self {
        case .clear:
            return "https://media.istockphoto.com/photos/sky-vertical-picture-id151526869?k=6&m=151526869&s=170667a&w=0&h=JhFhnmkq6fMTSSxXZiKHhrf-e_zA3zKczfqqsY_-_ss="
        case .hail:
            return "https://4.bp.blogspot.com/-gTznWBeTVX8/UUUZEdvBjKI/AAAAAAAAAQ0/kllf_sD6m7o/s1600/hailstorm.jpg"
        case .heavyCloud:
            return "https://www.elsetge.cat/myimg/f/152-1520158_dark-storm-clouds-iphone-x-wallpaper-storm-cloud.jpg"
        case .heavyRain:
            return "https://i.pinimg.com/736x/6f/5a/c2/6f5ac2c82451158822a4e4085bee4f44.jpg"
        case .lightCloud:
            return "https://i.pinimg.com/originals/ea/22/1f/ea221f88682cb01be8bdd56bc3f1fc57.jpg"
        case .lightRain:
            return "https://i.pinimg.com/originals/47/ec/27/47ec27a521be96d170ddad9257866873.jpg"
        case .showers:
            return "https://i.pinimg.com/736x/6f/5a/c2/6f5ac2c82451158822a4e4085bee4f44.jpg"
        case .sleet:
            return "https://i.pinimg.com/474x/31/eb/53/31eb53ad218875c064b713747da07609.jpg"
        case .snow:
            return "https://i.pinimg.com/474x/31/eb/53/31eb53ad218875c064b713747da07609.jpg"
        case .thunderstrom:
            return "https://i.pinimg.com/originals/00/b1/7b/00b17b62b06bb0482cca51297215c951.jpg"
        case .undetermined:
            return "image has not been set, error occured"
        }
    }
    
    var shortcutImage: UIImage {
        switch self {
        case .clear:
            guard let image = UIImage(named: "clear") else { return UIImage() }
            return image
        case .hail:
            guard let image = UIImage(named: "hail") else { return UIImage()}
            return image
        case .heavyCloud:
            guard let image = UIImage(named: "heavycloud") else { return UIImage() }
            return image
        case .heavyRain:
            guard let image = UIImage(named: "heavyrain") else { return UIImage() }
            return image
        case .lightCloud:
            guard let image = UIImage(named: "lightcloud") else { return UIImage() }
            return image
        case .lightRain:
            guard let image = UIImage(named: "lightrain") else { return UIImage() }
            return image
        case .showers:
            guard let image = UIImage(named: "heavyrain") else { return UIImage() }
            return image
        case .sleet:
            guard let image = UIImage(named: "sleet") else { return UIImage() }
            return image
        case .snow:
            guard let image = UIImage(named: "snow") else { return UIImage() }
            return image
        case .thunderstrom:
            guard let image = UIImage(named: "thunderstrom") else { return UIImage() }
            return image
        case .undetermined:
            guard let image = UIImage(named: "clear") else { return UIImage() }
            return image
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
