//
//  HeroMinMax.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import SwiftUI

struct HeroMinMaxView: View {
    
    var tempMax : Double
    var tempMin : Double
    
    var body: some View {
        HStack(spacing: 20){
            Text("Max: \(tempMax, specifier: "%.0f")°C")
            //Text("/")
            Text("Min: \(tempMin, specifier: "%.0f")°C")
        }
        .fontWidth(.standard)
        .fontWeight(.semibold)
        .padding(.init(top: 30, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    HeroMinMaxView(tempMax: 39, tempMin: 23)
}

