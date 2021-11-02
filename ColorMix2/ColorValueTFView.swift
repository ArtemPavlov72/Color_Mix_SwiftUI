//
//  ColorValueTFView.swift
//  ColorMix2
//
//  Created by Artem Pavlov on 02.11.2021.

// поле, куда можно вносить значение цвета для передачи в слайдер

import SwiftUI

struct ColorValueTFView: View {
    
    @Binding var textValue: String //переменная принимает вводимое текстовое значение
    @Binding var value: Double //переменная принимает значение из слайдера
    
    @State private var showAlert = false //объявляем свойство алерта, по умолчанию выключен
    
    var body: some View {
        TextField("", text: $textValue) { _ in //в текстовое поле передаем текстовое значение, которое конвертируется из значения, передаваемое из слайдера
            
            
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing) //выравнивание для текста
        .textFieldStyle(.roundedBorder) //стиль текста
        .keyboardType(.decimalPad)// стиль вызываемой клавиатуры
        .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
            Text("Please, enter value from 0 to 255")
        }
    }
}

extension ColorValueTFView {
    private func checkValue() {
        //проверяем вводимое значение textValue (которое переводим в Int)
        //если соответствует диапазону цвета от 0 до 255, то тогда ОК
        if let value = Int(textValue), (0...255).contains(value) {
            //переводим вводимое значение в Double
            self.value = Double(value)
            return
        }
        //если проверка не проходит, то вызывается аллерт и значения устанавливаются на 0
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}


struct ColorValueTFView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.brown
            ColorValueTFView(textValue: .constant("100"), value: .constant(100.0))
        }
    }
}
