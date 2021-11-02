//
//  ContentView.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 31.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var isInputActive: Bool //свойство для работы с клавиатурой, определяет работаем ли мы с клавиатурой или нет
    
    var body: some View {
        //навигейшн вью нужен для работы с тулбаром, без него не работает
        NavigationView {
            ZStack {
                Color(.brown)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    ColorMixView(red: red, green: green, blue: blue) //заполняем color view
                    
                    //передаем значения в слайдеры:
                    VStack {
                        SliderView(sliderValue: $red, color: .red)
                        SliderView(sliderValue: $green, color: .green)
                        SliderView(sliderValue: $blue, color: .blue)
                    }
                    .frame(height: 150)
                    .focused($isInputActive) //фокусируемся на свойстве клавиатуры, по умолчанию isInputActive имеет false
                    .toolbar { //применяем тулбар для клавиатуры, чтобы разместить кнопку done
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isInputActive = false //по нажатию на кнопку меняем свойство клавиатуры - скрываем ее
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .onTapGesture { //скрываем клавиатуру по тапу
            if isInputActive == true { //если активна клавиатура, то по тапу экрана мы ее скрываем
                isInputActive.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
