//
//  Coordinator.swift
//  CheckMe
//
//  Created by Tim Halli on 22/12/2023.
//

import UIKit

final class Coordinator {
    var value: Double
    
    init(_ value: Double) {
        self.value = value
    }
    
    @objc func valueChanged(_ sender: UISlider) {
        value = Double(sender.value)
    }
}
