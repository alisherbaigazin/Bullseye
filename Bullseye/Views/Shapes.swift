//
//  Shapes.swift
//  Bullseye
//
//  Created by Alisher Baigazin on 20.04.2022.
//

import SwiftUI

struct Shapes: View {
    var imageName: String
    var body: some View {
        Text(imageName)
            .font(.title)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .foregroundColor(Color("TextColor"))
            .background( RoundedRectangle(cornerRadius: 21)
                .strokeBorder(Color.black, lineWidth: 2))
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes(imageName: "56")
    }
}
