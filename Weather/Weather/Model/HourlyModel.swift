//
//  HourlyModel.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import Foundation

struct HourlyBody: Codable, Identifiable {
    var id: UUID = UUID()
    let dateTime: String
    let weatherIcon: Int
    let temperature: Temperature1

    enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
        case weatherIcon = "WeatherIcon"
        case temperature = "Temperature"
    }
}

struct Temperature1: Codable {
    let value: Int

    enum CodingKeys: String, CodingKey {
        case value = "Value"
    }
}

struct DecodedTime: Decodable {
    let formattedTime: String

    private enum CodingKeys: String, CodingKey {
        case dateTime
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateTimeString = try container.decode(String.self, forKey: .dateTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Adjust format if needed
        guard let date = dateFormatter.date(from: dateTimeString) else {
            throw DecodingError.dataCorrupted(
                DecodingError.Context(codingPath: container.codingPath, debugDescription: "Invalid date format")
            )
        }
        dateFormatter.dateFormat = "hh:mm a" 
        formattedTime = dateFormatter.string(from: date)
    }
}

typealias HourlyResponse = [HourlyBody]

extension HourlyView {
  func fahrenheitToCelsius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5.0 / 9.0
  }
}



