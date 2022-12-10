//
//  ColorCircleView.swift
//  TrafficLigthSwiftUI
//
//  Created by Armen Madoyan on 09.12.2022.
//

import SwiftUI

struct ColorCircleView: View {
    let color: Color
    let opacity: Double
    
    
    var body: some View {
        Circle()
            .foregroundColor(color.opacity(opacity))
            .frame(width: 150)
            .overlay(Circle().stroke(Color.black, lineWidth: 3))
            .shadow(color: color, radius: 50)
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .red, opacity: 0.3)
    }
}

