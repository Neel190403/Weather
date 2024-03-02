//
//  BackgroundViewList.swift
//  Screen1draft
//
//  Created by Neel Pandya on 21/02/24.
//

import SwiftUI

struct BackgroundViewList: View {
    
    @State private var cloudPosition = CGPoint.zero
    var weathericon : Int
    
    var body: some View {
        
        Image("storm-clouds")
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
        
//        func selectBackground(Int icon){
//            
//        }
    }
}


#Preview {
    BackgroundViewList(weathericon: 1)
}
