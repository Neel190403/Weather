//
//  HourlyManager.swift
//  draft2
//
//  Created by Neel Pandya on 19/02/24.
//

import CoreLocation
import Foundation

class HourlyManager {
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    func getHourlyWeather(cityKey: Int) async throws -> HourlyResponse {
        
        guard let url = URL(string: "https://dataservice.accuweather.com/forecasts/v1/hourly/12hour/\(cityKey)?apikey=Gv5PNIvuIEuWXibUcGFEr5854YLwfxD1&language=en-us&details=false&metric=false") else { fatalError("Missing URL") }


        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(HourlyResponse.self, from: data)
        
        return decodedData
    }
}


