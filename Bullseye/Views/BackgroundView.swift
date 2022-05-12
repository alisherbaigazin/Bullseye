//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 20.04.2022.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    @State var leaderboardIsVisible = false
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }, label: {
                RoundedImageViewStroked(imageName: "arrow.counterclockwise")
            })
            Spacer()
            Button(action: {
                leaderboardIsVisible = true
            }) {
                RoundedImageViewFilled(imageName: "list.dash")
            }
            .sheet(isPresented: $leaderboardIsVisible, onDismiss: {}, content: {LeaderboardView(game: $game, leaderboardIsVisible: $leaderboardIsVisible)})
        }
        
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "score", text: String(game.score))
            Spacer()
            NumberView(title: "round", text: String(game.round))
        }
        
    }
}

struct NumberView: View {
    var title: String
    var text: String
    var body: some View {
        VStack {
            LabelText(title: title)
            RoundRectTextView(text: text)
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ForEach(1..<6) {ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(0.8 * opacity), Color("RingColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
                //каждый раз рисует новый круг и закрашивает его от центра
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
