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
    @State private var sliderValue = Double.random(in: 1...100)
    @State private var randomNumber = Double.random(in: 1...100)
    
    private var distance: Double {
        abs(sliderValue - randomNumber)
    }
    
    private var opacity: Double {
        Double((80 - distance) / 80)
    }
    
    private var taskName: String {
        "Продвиньте слайдер, как можно ближе к: \(Int(randomNumber))"
    }
    
    var body: some View {
        VStack {
            Text(taskName)
            HStack {
                Text("0")
                UISliderRepresentation(value: $sliderValue, opacity: opacity)
                    .frame(width: 300, height: 50)
                Text("100")
            }
            
            Button(checkMe) { checkResult() }
            .padding()
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text(result),
                      message: Text(resultMessage),
                      dismissButton: .default(Text(ok)))
            }
            Button(start) { restart() }
            .padding()
        }
    }
    
    private func restart() {
        randomNumber = Double.random(in: 1...100)
        sliderValue = Double.random(in: 1...100)
    }
    
    private func checkResult() {
        let percent = 100 - distance
        resultMessage = "Ваш результат: \(Int(percent))%"
        showAlert = true
    }
}

#Preview {
    ContentView()
 }
