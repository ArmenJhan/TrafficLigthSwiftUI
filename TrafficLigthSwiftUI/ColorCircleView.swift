//
//  ColorCircleView.swift
//  TrafficLigthSwiftUI
//
//  Created by Armen Madoyan on 09.12.2022.
//

import SwiftUI

struct ColorCircleView: View {
    let color: Color
    let radius: CGFloat
    var shine: CGFloat
    
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: radius)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(color: color, radius: 20)
            .opacity(shine)
        
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .red, radius: 150, shine: 0.3)
    }
}

