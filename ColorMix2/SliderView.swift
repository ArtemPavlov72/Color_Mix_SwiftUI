//
//  Slider.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 31.10.2021.
//

import SwiftUI

struct SliderView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    
    let color: Color
    
    var body: some View {
        SliderParametrs(value: $sliderValue, color: color)
    }
    
    func get1Value() -> Double {
        
        return SliderParametrs.getValue()
    }

}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(color: .green)
    }
}

struct SliderParametrs: View {
    @Binding var value: Double
    
    let color: Color
    
    func getValue() -> String {
         return value
    }
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            Text("\(lround(value))")
                .frame(width: 35)
        }
    }
}



