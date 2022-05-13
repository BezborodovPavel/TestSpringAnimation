//
//  ViewController.swift
//  TestSpringAnimation
//
//  Created by Павел on 10.05.2022.
//

import Spring

class MainViewController: UIViewController {

    @IBOutlet weak var doAnimateButton: UIButton!
    @IBOutlet weak var stackViews: UIStackView!
    
    private var animations: [Animation]!
    private var numberCurrentAnimation = -1
    private var numberNextAnimation: Int {
        numberCurrentAnimation == animations.count - 1 ? 0 : numberCurrentAnimation + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animations = dataManager.getRandomAnimation()
        settingsView()
        numberCurrentAnimation = numberNextAnimation
    }

    @IBAction func buttonPress() {
        
        settingsView()
        animateElements()
        numberCurrentAnimation = numberNextAnimation
    }
    
    private func animateElements() {
        
        var delay = 0.0
        
        stackViews.arrangedSubviews.forEach { viewFromStack in
            
            if let labeledView = viewFromStack as? SpringViewLabeled {
                labeledView.setAnimatingSetingsWithAddDelay(settings: animations[numberCurrentAnimation], addDelay: delay)
                labeledView.animate()
                delay += 0.3
            }
        }
    }
    
    private func settingsView() {
        
        for (index, viewFromStack) in stackViews.arrangedSubviews.enumerated() {
            
            guard let labeledView = viewFromStack as? SpringViewLabeled else {return}
            
            if numberCurrentAnimation == -1 {
                
                labeledView.label = "No current settings"
                
            } else {
                
                let currentAnimationForSettings = animations[numberCurrentAnimation]
                
                switch index {
                case 0:
                    labeledView.label = "Preset: \(currentAnimationForSettings.preset)"
                case 1:
                    labeledView.label = "Curve: \(currentAnimationForSettings.curve)"
                case 2:
                    labeledView.label = "Force: \(currentAnimationForSettings.force)"
                case 3:
                    labeledView.label = "Duration: \(currentAnimationForSettings.duration)"
                case 4:
                    labeledView.label = "Delay: \(currentAnimationForSettings.delay)"
                default:
                    labeledView.label = ""
                }
            }
        }
        
        let nextAnimationForSettings = animations[numberNextAnimation]
        doAnimateButton.setTitle("Next animation: \(nextAnimationForSettings.preset)", for: UIControl.State.normal)
    }
    
}

