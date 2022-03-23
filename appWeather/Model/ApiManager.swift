//
//  NetworkModel.swift
//  appWeather
//
//  Created by Петр Постников on 17.03.2022.
//

import Foundation

enum ApiType{
    case Yakutsk
    case Moskva
    case Novosibirsk
    case SanktPeterburg
    
    var NameTownRu:String {
        switch self{
        case .Yakutsk: return "Якутск"
        case .Novosibirsk: return "Новосибирск"
        case .Moskva: return "Москва"
        case .SanktPeterburg: return "Санкт-Петербург"
        }
    }
    
    var URLTown:String {
        switch self{
        case .Yakutsk: return "https://api.weather.yandex.ru/v2/forecast?lat=62.0138&lon=129.4355&lang=ru_RU&limit=7"
        case .Moskva: return "https://api.weather.yandex.ru/v2/forecast?lat=55.4507&lon=37.3656&lang=ru_RU&limit=7"
        case .Novosibirsk: return "https://api.weather.yandex.ru/v2/forecast?lat=55.0229&lon=82.5604&lang=ru_RU&limit=7"
        case .SanktPeterburg: return
            "https://api.weather.yandex.ru/v2/forecast?lat=59.5632&lon=30.1885&lang=ru_RU&limit=7"
        }
    }
    var KeyHeader:String {
        return "e2159e4f-883f-4d42-96c6-c5e216934a9f"
    }
    var header:String {
        return "X-Yandex-API-Key"
    }
    var request:URLRequest {
        let url = URL(string: URLTown)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(KeyHeader, forHTTPHeaderField: header)
        return request
    }
}

class ApiManager{
    
    static func getInfoWeatherApi(request:URLRequest, _ completion: @escaping (WeatherModel) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let decodedData = try? JSONDecoder().decode(WeatherModel.self, from: data){
                completion(decodedData)
            } else {
                print("Error:\(String(describing: error))")
            }
        }.resume()
    }
}
    
