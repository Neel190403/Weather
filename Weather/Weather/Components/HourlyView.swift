//
//  HourSummaryView.swift
//  draft2
//
//  Created by Neel Pandya on 17/02/24.
//

import SwiftUI

struct HourlyView: View {
    let temp: Int
    let icon: Int
    let dateTime: String

    var body: some View {
        VStack(spacing: 10) {
            Text("\(fahrenheitToCelsius(fahrenheit: Double(temp)), specifier: "%.0f")°C")
                .font(.caption)
                .fontWeight(.medium)
            Image(systemName : mapWeatherIconToSFSymbol(iconNumber: icon) ?? "sun.max.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .symbolRenderingMode(.multicolor)
            Text(formatTime(dateTime))
                .font(.caption)
                .fontWeight(.medium)
        }
        .frame(width: 60, height: 80)
        .padding(10)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
    
}

#Preview {
    HourlyView(temp: 19, icon: 1, dateTime: "2024-02-20T17:00:00+05:30") 
}
