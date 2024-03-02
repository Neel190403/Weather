//
//  ListModel.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import Foundation
import SwiftData

struct ListElement: Codable, Hashable, Equatable, Identifiable {
    let id: UUID = UUID()
    let key, englishName: String
    let country: Country
    let geoPosition: GeoPosition
    let localObservationDateTime: String
    let weatherText: String
    let weatherIcon: Int
    let temperature: Temperature

    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case englishName = "EnglishName"
        case country = "Country"
        case geoPosition = "GeoPosition"
        case localObservationDateTime = "LocalObservationDateTime"
        case weatherText = "WeatherText"
        case weatherIcon = "WeatherIcon"
        case temperature = "Temperature"
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
    
    static func == (lhs: ListElement, rhs: ListElement) -> Bool {
            return lhs.id == rhs.id
        }
    
    init(key: String, englishName: String, country: Country, geoPosition: GeoPosition, localObservationDateTime: String, weatherText: String, weatherIcon: Int, temperature: Temperature) {
        self.key = key
        self.englishName = englishName
        self.country = country
        self.geoPosition = geoPosition
        self.localObservationDateTime = localObservationDateTime
        self.weatherText = weatherText
        self.weatherIcon = weatherIcon
        self.temperature = temperature
    }
}

// MARK: - Country
struct Country: Codable {
    let englishName: String

    enum CodingKeys: String, CodingKey {
        case englishName = "EnglishName"
    }
}

// MARK: - GeoPosition
struct GeoPosition: Codable {
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "Latitude"
        case longitude = "Longitude"
    }
}

// MARK: - Temperature
struct Temperature: Codable {
    //let id: UUID = UUID()
    let metric: Metric?
    let minimum, maximum: Imum?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
        case metric = "Metric"
    }
}


// MARK: - Metric
struct Metric: Codable {
    let value: Double
    let unit: String
    let unitType: Int

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}


typealias ListBody = [ListElement]
