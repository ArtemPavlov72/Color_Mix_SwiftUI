//
//  Slider.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 31.10.2021.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var sliderValue: Double //принимает значение от слайдера
    @State private var textValue = "" // первичный источник данных, передаем значение в текстовое  поле
    
    let color: Color
    
    var body: some View {
        HStack{
            ColorValueTextView(value: sliderValue)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color) //цвет для слайдера
            // чтобы в реальном времени передавать значения из слайдера в текстовое поле, используем onChange
                .onChange(of: sliderValue) { isOnFocus in //isOnFocus - это обновленное значение, передаем его в текстовое поле textValue
                    textValue = "\(lround(isOnFocus))"
                }
            ColorValueTFView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            SliderView(sliderValue: .constant(100), color: .red)
        }
    }
}





