//
//  ContentView.swift
//  TrafficLigthSwiftUI
//
//  Created by Armen Madoyan on 09.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var red  = ColorCircleView(color: .red, radius: 150, shine: 0.3)
    @State var yellow = ColorCircleView(color: .yellow, radius: 150, shine: 0.3)
    @State var green = ColorCircleView(color: .green, radius: 150, shine: 0.3)
    
    @State var label = " Start"
    @State var isTapped = true
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
                .foregroundColor(.black)
            VStack{
                red
                    .padding()
                yellow
                    .padding()
                green
                    .padding()
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
            }
            .padding(.bottom, 80)
        }
    }
    
    func startButtonTapped() {
        label = "Next"
        if isTapped {
            red.shine = 1
            isTapped = false
        } else if red.shine == 1 {
            red.shine = 0.3
            yellow.shine = 1
        } else if yellow.shine == 1 {
            yellow.shine = 0.3
            green.shine = 1
        } else if green.shine == 1 {
            green.shine = 0.3
            red.shine = 1
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
