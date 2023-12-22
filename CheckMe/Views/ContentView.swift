//
//  ContentView.swift
//  CheckMe
//
//  Created by Tim Halli on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var resultMessage = ""
    @State private var sliderValue: Double = 0
    @State private var randomNumber = Double.random(in: 1...100)
 
    private var header: String {
        "Продвиньте слайдер, как можно ближе к: \(Int(randomNumber))"
    }
    
    init() {
        _sliderValue = State(initialValue: randomNumber)
    }
    
    var body: some View {
        VStack {
            Text(header)
            
            UISliderRepresentation(value: $sliderValue, number: $randomNumber)
                .frame(width: 300, height: 50)
            
            Button("Проверь меня!") {
                checkResult()
            }
            .padding()
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Результат"),
                      message: Text(resultMessage),
                      dismissButton: .default(Text("ОК")))
            }
            
            Button("Начать заново") {
                restart()
            }
            .padding()
        }
        .padding()
    }
    
    private func restart() {
        randomNumber = Double.random(in: 1...100)
        sliderValue = Double(self.randomNumber)
    }
    
    private func checkResult() {
        let distance = abs(sliderValue - randomNumber)
        let percent = 100 - distance
        
        resultMessage = "Ваш результат: \(Int(percent))%"
        showAlert = true
    }
}

#Preview {
    ContentView()
 }
