//
//  ColorMixView.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 01.11.2021.
//

import SwiftUI

struct ColorMixView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(
                //передаем значения цветов во view
                Color(
                    red: red/255,
                    green: green/255,
                    blue: blue/255
                )
            )
            .frame(width: 350, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.white, lineWidth: 10)
            )
    }
}

struct ColorMixView_Previews: PreviewProvider {
    static var previews: some View {
        ColorMixView(red: 70, green: 10, blue: 40)
    }
}

