//
//  ContentView.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 12.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()

    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, isVisible ? 0 : 100)
                if isVisible {
                    PointsView(sliderValue: $sliderValue, isVisible: $isVisible, game: $game)
                        .transition(.scale)
                } else {
                    HitMeView(sliderValue: $sliderValue, isVisible: $isVisible, game: $game)
                        .transition(.scale)
                }
            }
            if !isVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.horizontal, 30.0)
            BigText(text: game.target)
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            .padding()
            SliderLabelText(text: "100")
        }
        .padding(.horizontal, 10.0)
    }
}

struct HitMeView: View {
    @Binding var sliderValue: Double
    @Binding var isVisible: Bool
    @Binding var game: Game
    var body: some View {
        Button(action: {
            withAnimation{
                isVisible = true
            }
        }, label: {
            Text("Hit me")
                .bold()
                .font(.title3)
                .textCase(.uppercase)
        })
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            .foregroundColor(Color.white)
            .cornerRadius(Constants.General.roundedRectCornerRadius)
            .overlay(RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
                     )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
