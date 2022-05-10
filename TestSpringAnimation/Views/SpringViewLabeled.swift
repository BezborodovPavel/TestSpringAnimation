//
//  File.swift
//  TestSpringAnimation
//
//  Created by Павел on 10.05.2022.
//

import Spring

class SpringViewLabeled: SpringView {
    
    var label: String = "Property" {
        didSet {
            for someView in subviews {
                if let labelOnView = someView as? UILabel {
                    labelOnView.text = label
                }
            }
        }
    }
    
    func setAnimatingSetingsWithAddDelay(settings: Animation, addDelay: Double) {
        
        self.animation = settings.preset.rawValue
        self.curve = settings.curve.rawValue
        self.force = settings.force
        self.delay = settings.delay + addDelay
        self.duration = settings.duration
        
    }
}
