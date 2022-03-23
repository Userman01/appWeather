//
//  WeatherModel.swift
//  appWeather
//
//  Created by Петр Постников on 17.03.2022.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let now: Int
    let nowDt: String
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]

    enum CodingKeys: String, CodingKey {
        case now
        case nowDt = "now_dt"
        case info
        case fact, forecasts
    }
}

// MARK: - Info
struct Info: Codable {
    let lat, lon: Double
    let tzinfo:Tzinfo
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, tzinfo
    }
}

struct Tzinfo: Codable {
    let name, abbr: String
}

// MARK: - Fact
struct Fact: Codable {
    let obsTime, uptime: Int?
    let temp, feelsLike: Int
    
    enum CodingKeys: String, CodingKey {
        case obsTime = "obs_time"
        case uptime, temp
        case feelsLike = "feels_like"
    }
}
// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let parts: Parts
}
// MARK: - Parts
struct Parts:Codable {
    let morning, evening: Day
    let night, day: Day

    enum CodingKeys: String, CodingKey {
            case morning, evening
            case night, day
    }
}
// MARK: - Day
struct Day: Codable {
    let tempMin, tempAvg, tempMax: Int?
    let windSpeed: Double
    let feelsLike: Int

    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempAvg = "temp_avg"
        case tempMax = "temp_max"
        case windSpeed = "wind_speed"
        case feelsLike = "feels_like"
    }
}

