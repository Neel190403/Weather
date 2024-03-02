//
//  prevPinnedCities.swift
//  Screen1draft
//
//  Created by Neel Pandya on 23/02/24.
//

import Foundation
import SwiftData

@Model
class UserPinnedCities{
    @Attribute(.unique) var key : String
    
    var cityName: String
    
    init(key: String, cityName: String) {
        self.key = key
        self.cityName = cityName
    }
}
