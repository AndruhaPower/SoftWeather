//
//  NativeExtensions.swift
//  SoftWeather
//
//  Created by Andrew on 09/01/2020.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
