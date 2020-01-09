//
//  DateConverter.swift
//  SoftWeather
//
//  Created by Andrew on 26/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation

struct DateConverter {
    
    static func getDate(from string: String) -> String {
        
        var temp = string
        temp.removeLast(13)
    
        let dateFormatterGetter = DateFormatter()
        dateFormatterGetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.locale = Locale(identifier: "ru_RU")
        dateFormatterPrint.dateFormat = "EEEE, d MMMM"
        
        var exitString = ""
        
        if let date = dateFormatterGetter.date(from: temp) {
            exitString = dateFormatterPrint.string(from: date)
        }
        
        return exitString
    }
    
    static func getDay(from string: String) -> String {
        
        let temp = string
        
        let dateFormatterGetter = DateFormatter()
        dateFormatterGetter.dateFormat = "YYYY-M-DD"
        
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.locale = Locale(identifier: "ru_RU")
        dateFormatterPrint.dateFormat = "EE, d MMMM"
        
        var exitString = ""
        
        if let date = dateFormatterGetter.date(from: temp) {
            exitString = dateFormatterPrint.string(from: date)
        }
        
        return exitString
    }
}
