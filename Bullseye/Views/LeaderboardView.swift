//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 26.04.2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var game: Game
    @Binding var leaderboardIsVisible: Bool
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsVisible: $leaderboardIsVisible)
                    .padding(.top)
                LabelView()
                ScrollView {
                    VStack(spacing: 10.0) {
                        ForEach(game.leaderboardEntries.indices, id: \.self) { i in
                            RowView(index: i + 1, score: game.leaderboardEntries[i].score, date: game.leaderboardEntries[i].date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(index: index)
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()

            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsVisible: Bool
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        ZStack {
            HStack {
                if horizontalSizeClass == .compact && verticalSizeClass == .regular
                {
                    BigBoldText(text: "leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {leaderboardIsVisible = false}, label: {
                    RoundedImageViewFilled(imageName: "xmark")
                    .padding(.trailing)
                })
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(title: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(title: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}


struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsVisible = Binding.constant(false)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        LeaderboardView(game: game, leaderboardIsVisible: leaderboardIsVisible)
            .previewInterfaceOrientation(.portrait)
        LeaderboardView(game: game, leaderboardIsVisible: leaderboardIsVisible)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
