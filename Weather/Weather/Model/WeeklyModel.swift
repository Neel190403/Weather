//
//  WeeklyModel.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import Foundation

struct WeeklyBody : Codable {
    let dailyForecasts: [DailyForecast]

    enum CodingKeys: String, CodingKey {
        case dailyForecasts = "DailyForecasts"
    }
}


struct DailyForecast: Codable, Identifiable {
    let id: UUID = UUID()
    let date: String
    let epochDate: Int
    let temperature: Temperature
    let day, night: Day

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        epochDate = try container.decode(Int.self, forKey: .epochDate)
        temperature = try container.decode(Temperature.self, forKey: .temperature)
        day = try container.decode(Day.self, forKey: .day)
        night = try container.decode(Day.self, forKey: .night)
    }

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case epochDate = "EpochDate"
        case temperature = "Temperature"
        case day = "Day"
        case night = "Night"
    }
}


struct Day: Codable {
    let icon: Int

    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
    }
}


struct Imum: Codable {
    let value: Double

    enum CodingKeys: String, CodingKey {
        case value = "Value"
    }
}


extension WeeklyView {
  func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5.0 / 9.0
  }
}
