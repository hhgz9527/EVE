//
//  GradientScrollView.swift
//  EVE
//
//  Created by 杜艺卓 on 15/8/31.
//  Copyright © 2015年 MoShou. All rights reserved.
//

import UIKit

class GradientScrollView: UIScrollView {
    let gradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0).CGColor, UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.17).CGColor, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0).CGColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        self.layer.insertSublayer(gradientLayer, atIndex: 0)
        
    }
}
