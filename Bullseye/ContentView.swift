//
//  ContentView.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 12.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPut the Bullseye as close as you can to")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
            Text("\(sliderValue)")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("Hit me") {
                self.isVisible = true
            }
            .alert(isPresented: $isVisible, content: {return Alert(title: Text("lol"), message: Text("\(sliderValue)"), dismissButton: .destructive(Text("cheburek")))})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
