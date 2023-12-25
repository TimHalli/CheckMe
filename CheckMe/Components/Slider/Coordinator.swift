//
//  Coordinator.swift
//  CheckMe
//
//  Created by Tim Halli on 22/12/2023.
//

import UIKit

final class Coordinator {
    var parent: UISliderRepresentation
    
    init(_ parent: UISliderRepresentation) {
        self.parent = parent
    }
    
    @objc func valueChanged(_ sender: UISlider) {
        parent.value = Double(sender.value)
    }
}
