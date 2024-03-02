//
//  HeroSectionView.swift
//  draft2
//
//  Created by Neel Pandya on 16/02/24.
//

import SwiftUI

struct HeroSectionView: View {
    
    var imageIcon       : String
    var temp            : String
    var description     : String
    
    var body: some View {
        HStack (spacing: 15){
            Image(systemName: iconForWeather(imageIcon) ?? "sun.max.fill")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            
            
            VStack(alignment: .center) {
                Text("\(temp)°")
                    .font(.system(size: 70, weight: .semibold))
                    //.foregroundColor(.white)
                    .padding(.init(top: 0, leading: 35, bottom: 0, trailing: 0))
                
                Text("\(description.capitalized)")
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 0))
            }
        }
    }
    
}

#Preview {
    HeroSectionView(imageIcon: "01d", temp: "23", description: "Cloudy Rainy")
}
