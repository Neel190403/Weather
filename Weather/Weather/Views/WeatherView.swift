//
//  WeatherView.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import SwiftUI
import SafariServices

struct WeatherView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var forecast: ResponseBody
    var weeklyManager = WeeklyManager()
    @State var weekly: WeeklyBody?
    var hourlyManager = HourlyManager()
    @State var hourcast: HourlyResponse?
    var key : Int
    @State private var isShowingSafariView = false
    var cityNameFromList : String
    
    var body: some View {
        ZStack{
            BackgroundView(colorScheme: colorScheme)
            VStack {
                HStack{
                    VStack(alignment: .center, spacing: 5) {
                        Text(cityNameFromList)
                            .bold()
                            .font(.title)
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day()))")
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    //.foregroundColor(.black)
                    .padding(.init(top: 30, leading: 0, bottom: 0, trailing: 0))
                
                }
                .padding(.top)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        VStack {
                            VStack (spacing: -10){
                                HeroSectionView(imageIcon: forecast.weather[0].icon,
                                                temp: forecast.main.feelsLike.roundDouble(), description: forecast.weather[0].description)
                                
                                HeroMinMaxView(tempMax: forecast.main.tempMax, tempMin: forecast.main.tempMin)
                            }
                            .padding(.init(top: 10, leading: 0, bottom: 40, trailing: 0))
                            
                            VStack{
                                HStack {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("Current Weather")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                }
                                .frame(width: 380, height: 15)
                                .padding(.horizontal)
                                .padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10)
                                Divider()
                                HStack {
                                    DetailsView(logo: "humidity.fill", name: "Humidity", value: "\(forecast.main.humidity.roundDouble())%")
                                        .padding(.leading)
                                    Spacer()
                                    DetailsView(logo: "wind.circle", name: "Wind speed", value: (forecast.wind.speed.roundDouble() + " m/s"))
                                    Spacer()
                                    DetailsView(logo: "tirepressure", name: "Pressure", value: "\(forecast.main.humidity.roundDouble())bar")
                                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    Spacer()
                                    DetailsView(logo: "eye", name: "Visibility", value: (forecast.wind.speed.roundDouble() + "km"))
                                        .padding(.trailing)
                                }
                            }
                            .frame(width: 350, height: 100)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .transition(.identity)
                            .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                            
                            VStack{
                                HStack {
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("12-Hour Forecast")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                }
                                .frame(width: 350, height: 35)
                                .padding(.horizontal)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10)
                                //Divider()
                                VStack {
                                    if let hourcast = hourcast {
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack (spacing:2){
                                                ForEach(hourcast) { hourWeather in
                                                    HourlyView(temp: hourWeather.temperature.value,
                                                               icon: hourWeather.weatherIcon,
                                                               dateTime: hourWeather.dateTime)
                                                }
                                            }
                                        }
                                    } else {
                                        LoadingView()
                                    }
                                }
                                .padding(.init(top: -6, leading: 10, bottom: 0, trailing: 0))
                                .task {
                                    do {
                                        hourcast = try await HourlyManager().getHourlyWeather(cityKey: key)
                                    } catch {
                                        print("Error getting weather: \(error)")
                                    }
                                }
                            }
                            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
                            
                            
                            VStack {
                                HStack {
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("5-Day Forecast")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                }
                                .frame(width: 380, height: 25)
                                .padding(.horizontal)
                                .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10)
                                Divider()
                                VStack {
                                    if let weekly = weekly {
                                        ForEach(weekly.dailyForecasts) { weather in
                                            WeeklyView(maximum: weather.temperature.maximum?.value ?? 0,
                                                       minimum: weather.temperature.minimum?.value ?? 0,
                                                       dateStr: weather.date,
                                                       icon1: weather.day.icon,
                                                       icon2: weather.night.icon)
                                        }
                                        .padding(-10)
                                    } else {
                                        LoadingView()
                                    }
                                }
                                .ignoresSafeArea()
                                .padding(.init(top: 5, leading: 0, bottom: 20, trailing: 0))
                                .task {
                                    do {
                                        weekly = try await weeklyManager.getWeeklyWeather(cityKey: key)
                                    } catch {
                                        print("Error getting weather: \(error)")
                                    }
                                }
                            }
                            .frame(width: 380)
                            .cornerRadius(30, corners: UIRectCorner())
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .padding(.init(top: 10, leading: 0, bottom: 45, trailing: 0))
                            
                            Spacer()
                            
                        }
                    }
                    
                }
                ToolbarDetailsPage(isShowingSafariView: $isShowingSafariView)
                    .frame(width: 400, height: 55)
                    //.background(.white)
                    .background(Color(.secondarySystemBackground))
            }
            Spacer()
            
        }
        .navigationBarBackButtonHidden()
        .padding(.init(top: 50, leading: 0, bottom: 0, trailing: 0))
    }

    
}

#Preview {
    WeatherView(forecast: previewWeather, key: 3351818, cityNameFromList: "Hyderabad")
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

