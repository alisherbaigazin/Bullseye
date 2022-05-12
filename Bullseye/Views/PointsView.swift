//
//  PointsView.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 26.04.2022.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var isVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "THE SLIDERS VALUE IS")
            BigText(text: roundedValue)
            BodyText(text: "You scored \(points) points\n🎊🎊🎊")
            Button(action: {
                withAnimation {
                    isVisible = false
                }
                game.startNewRound(points: points)}) {
                ButtonText(text: "Start New Round")
                }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var sliderValue = Binding.constant(50.0)
    static private var isVisible = Binding.constant(false)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(sliderValue: sliderValue, isVisible: isVisible, game: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portraitUpsideDown)
        PointsView(sliderValue: sliderValue, isVisible: isVisible, game: game)
            .preferredColorScheme(.dark)
    }
}
