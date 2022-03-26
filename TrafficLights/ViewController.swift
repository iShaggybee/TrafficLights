//
//  ViewController.swift
//  TrafficLights
//
//  Created by Kislov Vadim on 26.03.2022.
//

import UIKit

enum LightState {
   case red
   case orange
   case green
}

class ViewController: UIViewController {
    var currentLightState: LightState?
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var orangeLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var lightsContainer: UIStackView!
    @IBOutlet var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        lightsContainer.layer.borderColor = UIColor.black.cgColor
        lightsContainer.layer.borderWidth = 2
        lightsContainer.layer.cornerRadius = 14
        
        for light in [redLight, orangeLight, greenLight] {
            light!.layer.cornerRadius = light!.layer.bounds.width / 2
        }
    }
 
    @IBAction func onChangeLight(_ sender: Any) {
        actionButton.setTitle("Next", for: .normal)
        
        switch currentLightState {
        case .none:
            currentLightState = .red
            redLight.alpha = 1
        case .red:
            currentLightState = .orange
            redLight.alpha = 0.3
            orangeLight.alpha = 1
        case .orange:
            currentLightState = .green
            orangeLight.alpha = 0.3
            greenLight.alpha = 1
        case .green:
            currentLightState = .red
            greenLight.alpha = 0.3
            redLight.alpha = 1
        }
    }
}

