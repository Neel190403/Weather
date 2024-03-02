//
//  CityView.swift
//  Screen1draft
//
//  Created by Neel Pandya on 20/02/24.
//

import SwiftUI

struct CityView: View {
    
    var city : ListElement
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack{
            //BackgroundView0(city.temperature)
            HStack {
                VStack(alignment: .leading) {
                    Text("\(city.englishName)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(formatTime(_:city.localObservationDateTime))
                        .font(.caption)
                }
                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Spacer()
                    Text("\(city.temperature.metric?.value ?? 0, specifier: "%.0f")°")
                        .font(.title)
                        .padding(.init(top: 0, leading: 0, bottom: -12, trailing: 0))
                    Text("\(city.weatherText)")
                        .font(.caption)
                        .padding(.init(top: 0, leading: 0, bottom: 5, trailing: 10))
                    Spacer()
                }
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            }
            .frame(width: 365, height: 100)
//            .background(isPinned ? (colorScheme == .light ? Color(hue: 0.6, saturation: 0.3, brightness: 0.9) : .brown)
//                        :
//                            (colorScheme == .light ? Color(hue: 0.1, saturation: 0.3, brightness: 0.9) : .secondary))
            .background(colorScheme == .light ? Color(hue: 0.6, saturation: 0.3, brightness: 0.9) : Color(.systemGray6))
            //.background(Color(.systemGray6))
            .cornerRadius(20)
        }
    }
    
    
}

