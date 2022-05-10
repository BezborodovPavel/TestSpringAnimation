//
//  Animation.swift
//  TestSpringAnimation
//
//  Created by Павел on 10.05.2022.
//

import Spring

struct Animation {
    
    var preset: Spring.AnimationPreset
    var curve: Spring.AnimationCurve
    var force: Double
    var duration: Double
    var delay: Double
    
    static func getRundomAnimations() -> [Animation] {
        
        var animations: [Animation] = []
        let countCurve = Spring.AnimationCurve.allCases.count
        
        for typeAnimation in Spring.AnimationPreset.allCases {
            
            let randomСurve = Int.random(in: 0..<countCurve)
            let curve = Spring.AnimationCurve.allCases[randomСurve]
            let force = round(Double.random(in: 1...5) * 10) / 10
            let duration = round(Double.random(in: 0.3...1) * 10) / 10
            let delay = round(Double.random(in: 0...1) * 10) / 10
            
            animations.append(Animation(preset: typeAnimation, curve: curve, force: force, duration: duration, delay: delay))
        }
    
        return animations
    }

}
