//
//  RoundView.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 20.04.2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.title)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .foregroundColor(Color("TextColor"))
            .overlay(Circle()
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedTextView: View {
    var index: Int
    
    var body: some View {
        Text(String(index))
            .font(.title3)
            .fontWeight(.bold)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .foregroundColor(Color("TextColor"))
            .overlay(Circle()
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedImageViewFilled: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.title)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .foregroundColor(Color("ButtonFilledColor"))
            .background(
            Circle()
                .fill(Color("ButtonFilledBackgroundColor")))
    }
}

struct RoundRectTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.bold)
            .font(.title3)
            .kerning(-0.2)
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .overlay(RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedImageViewStroked(imageName: "arrow.counterclockwise")
            RoundedImageViewFilled(imageName: "list.dash")
            RoundRectTextView(text: "99")
            RoundedTextView(index: 1)
        }
        .preferredColorScheme(.dark)
    }
}
