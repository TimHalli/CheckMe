//
//  SliderRepresentation.swift
//  CheckMe
//
//  Created by Tim Halli on 22/12/2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Double
    let opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .tintColor
        slider.thumbTintColor = .tintColor
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged(_:)),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .tintColor.withAlphaComponent(opacity)
    }
    
    internal func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

#Preview {
    UISliderRepresentation(value: .constant(0), opacity: 1)
}

