//
//  BackgroundView.swift
//  draft2
//
//  Created by Neel Pandya on 16/02/24.
//

import SwiftUI

struct BackgroundView: View {
    
    @State private var cloudPosition = CGPoint.zero
    var colorScheme : ColorScheme
    
    var body: some View {
        
        Image(colorScheme == .dark ? "storm-clouds" : "cloud")
            .resizable()
            .frame(width: 2000, height: 1800)
            .position(cloudPosition)
            .onAppear {
                let screenWidth = UIScreen.main.bounds.width
                let animationDuration = 100.0
                
                withAnimation(.linear(duration: animationDuration).repeatForever(autoreverses: true)) {
                    self.cloudPosition.x += screenWidth * 2.0
                }
            }
    }
}


#Preview {
    BackgroundView(colorScheme: .dark)
}

