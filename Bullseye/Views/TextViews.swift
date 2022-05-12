//
//  TextViews.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 14.03.2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigText: View {
    var text: Int
    var body: some View {
        Text("\(text)")
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
            Text(text)
                .bold()
                .foregroundColor(Color("TextColor"))
                .frame(width: 35.0)
    }
}

struct LabelText: View {
    var title: String
    
    var body: some View {
        Text(title.uppercased())
            .fontWeight(.bold)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
            .font(.subheadline)
            .foregroundColor(Color("TextColor"))
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View { 
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(12)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .fontWeight(.bold)
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .fontWeight(.bold)
    }
}

struct BigBoldText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigText(text: 999)
            SliderLabelText(text: "99")
            LabelText(title: "Score")
            BodyText(text: "You scored 89 points\n🎊🎊🎊")
            ButtonText(text: "Start New Round")
            ScoreText(score: 45)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
