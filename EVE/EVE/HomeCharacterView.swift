//
//  HomeCharacterView.swift
//  EVE
//
//  Created by 杜艺卓 on 15/8/1.
//  Copyright © 2015年 MoShou. All rights reserved.
//

import UIKit

class HomeCharacterView: UIView {
    let gradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0).CGColor, UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.17).CGColor, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0).CGColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, atIndex: 0)

    }
}
