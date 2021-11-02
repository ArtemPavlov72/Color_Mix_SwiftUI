//
//  ColorValueTextView.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 02.11.2021.

// Значение цвета, отображаемое слева от слайдера

import SwiftUI

struct ColorValueTextView: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))") //округляем до целых
            .frame(width: 35, alignment: .leading) //ширина 35 и расположение слева
            .foregroundColor(.white) //цвет текста
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.brown
            ColorValueTextView(value: 100)
        }
    }
}
