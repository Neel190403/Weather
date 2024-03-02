//
//  WeeklyManager.swift
//  draft2
//
//  Created by Neel Pandya on 17/02/24.
//

import Foundation
import CoreLocation

class WeeklyManager {
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    func getWeeklyWeather(cityKey : Int) async throws -> WeeklyBody {
        
        guard let url = URL(string: "https://dataservice.accuweather.com/forecasts/v1/daily/5day/\(cityKey)?apikey=Gv5PNIvuIEuWXibUcGFEr5854YLwfxD1&language=en-us&details=false&metric=false") else { fatalError("Missing URL") }


        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(WeeklyBody.self, from: data)
        
        return decodedData
    }
}



