//
//  SliderRepresentation.swift
//  CheckMe
//
//  Created by Tim Halli on 22/12/2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Double
    @Binding var number: Double
    
    typealias UIViewType = UISlider
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .tintColor
        slider.thumbTintColor = .tintColor
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged(_:)),
                         for: .valueChanged)
        updateOpacity(slider)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        updateOpacity(uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

#Preview {
    UISliderRepresentation(value: .constant(0), number: .constant(0))
}

private extension UISliderRepresentation {
    func updateOpacity(_ slider: UISlider) {
        let distance = abs(value - number)
        let maxDistance = 50.0
        let opacity = CGFloat((maxDistance - distance) / maxDistance)
        slider.thumbTintColor = .tintColor.withAlphaComponent(opacity)
    }
}
