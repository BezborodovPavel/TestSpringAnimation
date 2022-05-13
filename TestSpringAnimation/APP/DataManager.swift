//
//  dataManager.swift
//  TestSpringAnimation
//
//  Created by Павел on 13.05.2022.
//

import Spring

class dataManager {
 
    static func getRandomAnimation() -> [Animation] {
        
        var animations: [Animation] = []
        
        for typeAnimation in Spring.AnimationPreset.allCases {
            
            let curve = Spring.AnimationCurve.allCases.randomElement()!
            let force = round(Double.random(in: 1...5) * 10) / 10
            let duration = round(Double.random(in: 0.3...1) * 10) / 10
            let delay = round(Double.random(in: 0...1) * 10) / 10
            
            animations.append(Animation(preset: typeAnimation.rawValue , curve: curve.rawValue, force: force, duration: duration, delay: delay))
        }
    
        return animations
                
    }
}
