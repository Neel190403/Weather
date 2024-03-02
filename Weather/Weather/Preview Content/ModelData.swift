//
//  ModelData.swift
//  Screen1draft
//
//  Created by Neel Pandya on 20/02/24.
//

import Foundation

var previewList : ListBody = load("ListData.json")
var previewWeather: ResponseBody = load("WeatherData.json")
var weeklyWeather: WeeklyBody = load("WeeklyData.json")
var previewHourlyWeather: HourlyResponse = load("HourlyData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


