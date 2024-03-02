//
//  IconMapToSFSymbol.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import Foundation

func iconForWeather(_ imageName: String) -> String? {
  switch imageName {
  case "01d", "01n": return "sun.max.fill"
  case "02d", "02n": return "cloud.sun"
  case "03d", "03n": return "smoke"
  case "04d", "04n": return "cloud.drizzle.circle"
  case "09d", "09n": return "cloud.rain"
  case "10d", "10n": return "cloud.heavyrain"
  case "11d", "11n": return "cloud.bolt"
  case "13d", "13n": return "snow"
  case "50d", "50n": return "cloud.fog"
  default: return nil
  }
}

func mapWeatherIconToSFSymbol(iconNumber: Int) -> String? {
    switch iconNumber {
    case 1 : return "sun.min.fill"
    case 2 : return "sun.max.fill"
    case 3 : return "sun.min"
    case 4 : return "cloud.sun"
    case 5 : return "sun.haze"
    case 6 : return "cloud.circle"
    case 7 : return "cloud"
    case 8 : return "cloud.fill"
    case 11 : return "cloud.fog"
    case 12 : return "cloud.drizzle"
    case 13 : return "cloud.sun.rain.fill"
    case 14 : return "cloud.sun.rain"
    case 15 : return "tropicalstorm.circle.fill"
    case 16 : return "cloud.sun.bolt.fill"
    case 17 : return "cloud.sun.bolt.circle"
    case 18 : return "cloud.rain"
    case 19 : return "smoke"
    case 20 : return "cloud.sun.fill"
    case 21 : return "cloud.sun.circle"
    case 22 : return "cloud.snow"
    case 23 : return "sun.snow.fill"
    case 24 : return "snowflake"
    case 25 : return "cloud.sleet.fill"
    case 26 : return "cloud.rain.fill"
    case 29 : return "cloud.snow.fill"
    case 30 : return "thermometer.sun"
    case 31 : return "thermometer.snowflake"
    case 32 : return "wind"
    case 33,34 : return "sun.min"
    case 35 : return "cloud"
    case 36 : return "cloud.circle"
    case 37 : return "moon.zzz"
    case 38 : return "cloud.moon"
    case 39,40 : return "cloud.moon.rain"
    default: return "sun.min.fill"
    }
}
