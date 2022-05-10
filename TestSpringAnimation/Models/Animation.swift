//
//  Animation.swift
//  TestSpringAnimation
//
//  Created by Павел on 10.05.2022.
//

import Spring

struct Animation {
    
    let preset: Spring.AnimationPreset
    let curve: Spring.AnimationCurve
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getRundomAnimations() -> [Animation] {
        
        var animations: [Animation] = []
        
        for typeAnimation in Spring.AnimationPreset.allCases {
            
            let curve = Spring.AnimationCurve.allCases.randomElement()
            let force = round(Double.random(in: 1...5) * 10) / 10
            let duration = round(Double.random(in: 0.3...1) * 10) / 10
            let delay = round(Double.random(in: 0...1) * 10) / 10
            
            animations.append(Animation(preset: typeAnimation, curve: curve, force: force, duration: duration, delay: delay))
        }
    
        return animations
    }

}
