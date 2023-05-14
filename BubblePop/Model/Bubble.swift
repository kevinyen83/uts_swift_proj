// Bubble.swift
// BubblePop
//
// Created by Harry Hu on 21/4/2023.

import Foundation
import UIKit

class Bubble: UIButton{
    
    let xPosition = Int.random(in: 100...300)
    let yPosition = Int.random(in: 200...800)
    let color = randomColor()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = color
        self.frame = CGRect(x: xPosition, y:yPosition, width:50, height:50)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func animation(){
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.duration = 0.6
        springAnimation.fromValue = 1
        springAnimation.toValue = 0.8
        springAnimation.repeatCount = 1
        springAnimation.initialVelocity = 0.5
        springAnimation.damping = 1
        
        layer.add(springAnimation, forKey: nil)
    }
    
    func flash(){
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    static func randomColor() -> UIColor {
        let randomNumber = Int.random(in: 1...100)
        if randomNumber <= 40 {
            return .red
        } else if randomNumber <= 70 {
            return .magenta
        } else if randomNumber <= 85 {
            return .green
        } else if randomNumber <= 95 {
            return .blue
        } else {
            return .black
        }
    }
}

