//
//  WeatherView.swift
//  Screen1draft
//
//  Created by Neel Pandya on 20/02/24.
//

import SwiftUI

struct ContentView1: View {
    
    var city : ListElement
    var weatherManager = WeatherManager()
    @State var forecast: ResponseBody?
    
    var body: some View {
        VStack {
            if let forecast = forecast {
                WeatherView(forecast: forecast, key: Int(city.key) ?? 3351818, cityNameFromList : city.englishName)
                    .navigationBarBackButtonHidden(true)
        
                   // .transition(.move(edge: .trailing))
            } else {
                LoadingView()
            }
        }
        .ignoresSafeArea()
        .task {
            do {
                forecast = try await weatherManager.getCurrentWeather(latitude: city.geoPosition.latitude, longitude: city.geoPosition.longitude)
            } catch {
                print("Error getting weather: \(error)")
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    WeatherView(forecast: previewWeather, key: 3351818, cityNameFromList: "Hyderabad")
}
