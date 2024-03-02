//
//  DailyView.swift
//  draft2
//
//  Created by Neel Pandya on 17/02/24.
//

import SwiftUI

struct WeeklyView: View {
    
    var maximum : Double
    var minimum : Double
    var dateStr : String
    var icon1   : Int
    var icon2   : Int
    
    var body: some View {
        HStack {
            Text(formatDate(dateStr))
                .frame(width: 130, height: 20)
                .font(.callout)
                .padding(.init(top: 0, leading: -15, bottom: 0, trailing: 0))
            Spacer()
            Text("D:")
                .font(.caption)
            Image(systemName : mapWeatherIconToSFSymbol(iconNumber: icon1) ?? "sun.max.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .symbolRenderingMode(.multicolor)
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            Text("N:")
                .font(.caption)
            Image(systemName : mapWeatherIconToSFSymbol(iconNumber: icon2) ?? "sunset.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .symbolRenderingMode(.multicolor)
            Spacer()
            VStack {
                  Text("H: \(fahrenheitToCelsius(fahrenheit: maximum), specifier: "%.0f")°C")
                  Text("L: \(fahrenheitToCelsius(fahrenheit: minimum), specifier: "%.0f")°C")
                }
            .font(.caption)
            
        }
        .frame(width: 350, height: 13)
        .padding(.horizontal)
        .padding(.vertical, 22)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        
    }
    
}

#Preview {
    WeeklyView(maximum: 40, minimum: 35, dateStr: "17th Feb", icon1: 3, icon2: 5)
}

