//
//  WeatherRow.swift
//  draft2
//
//  Created by Neel Pandya on 16/02/24.
//

import SwiftUI

struct DetailsView: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: logo)
                .font(.title)
                .frame(width: 10, height: 10)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(25)

                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.caption)
        }
    }
}

#Preview {
    DetailsView(logo: "thermometer", name: "Feels like", value: "8°")
}
