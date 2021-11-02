//
//  ContentView.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 31.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = Double.random(in: 0...255)
    let redSlider = SliderView(color: .red)
    
    var body: some View {
        VStack {
           // ColorMixView(red:
             //               SliderView(color: .red), green: <#T##Double#>, blue: <#T##Double#>)
            //SliderView(color: .red)
            redSlider
        
            SliderView(color: .green)
            SliderView(color: .blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func CurrentSliderValue() {
    
   
}
