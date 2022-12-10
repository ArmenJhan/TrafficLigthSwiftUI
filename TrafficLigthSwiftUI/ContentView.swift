//
//  ContentView.swift
//  TrafficLigthSwiftUI
//
//  Created by Armen Madoyan on 09.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redCircleOpacity = 0.3
    @State private var yellowCircleOpacity = 0.3
    @State private var greenCircleOpacity = 0.3
    @State private var shadowColor: Color = .black
    
    @State private var currentColor = CurrentColor.red
    @State private var label = " Start"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
                .foregroundColor(.black)
            
            VStack{
                ColorCircleView(color: .red, opacity: redCircleOpacity)
                ColorCircleView(color: .yellow, opacity: yellowCircleOpacity)
                ColorCircleView(color: .green, opacity: greenCircleOpacity)
                Spacer()
                
                Button(action: startButtonTapped) {
                    Text(label)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 130, height: 50)
                }
                .background(Color.blue)
                .overlay(RoundedRectangle(cornerRadius: 17).stroke(Color.white, lineWidth: 4))
                .clipShape(RoundedRectangle(cornerRadius: 17))
                .shadow(color: shadowColor, radius: 50)
            }
            .padding(.bottom, 80)
        }
    }
    
    private func startButtonTapped() {
        let isOn = 1.0
        let isOff = 0.3
        label = "Next"
        
        if currentColor == .red {
            greenCircleOpacity = isOff
            redCircleOpacity = isOn
            currentColor = .yellow
            shadowColor = .red
        } else if currentColor == .yellow {
            redCircleOpacity = isOff
            yellowCircleOpacity = isOn
            shadowColor = .yellow
            currentColor = .green
        } else if currentColor == .green {
            yellowCircleOpacity = isOff
            greenCircleOpacity = isOn
            currentColor = .red
            shadowColor = .green
        }
    }
    
    enum CurrentColor {
        case red
        case yellow
        case green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
