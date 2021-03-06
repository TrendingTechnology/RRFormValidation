//
//  SpinerLayer.swift
//  TransitionButton
//
//  Created by Alaeddine M. on 11/1/15.
//  Copyright (c) 2015 Alaeddine M. All rights reserved.
//

import UIKit


class SpinerLayer: CAShapeLayer {
    
    var spinnerColor = UIColor.white {
        didSet {
            strokeColor = spinnerColor.cgColor
        }
    }
    
    init(frame: CGRect) {
        super.init() 

        self.setToFrame(frame)
        
        self.fillColor = nil
        self.strokeColor = spinnerColor.cgColor
        self.lineWidth = 1
        
        self.strokeEnd = 0.4
        self.isHidden = true
     }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(layer: Any) {
        super.init(layer: layer)

    }
    
    func animation() {
        self.isHidden = false
        RRBallRotate.setupSpinnerAnimation(layer: self, frame: frame, color: spinnerColor, spinnerSize: nil)
    }
    
    func setToFrame(_ frame: CGRect) {
        self.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
    }
    
    func stopAnimation() {
        self.isHidden = true
        self.removeAllAnimations()
        removeAnimationLayer()
    }
    
    func removeAnimationLayer() {
        if self.sublayers != nil {
            for item in self.sublayers! where item is SpinnerLayers {
                item.removeAllAnimations()
                item.removeFromSuperlayer()
            }
        }
    }
}

