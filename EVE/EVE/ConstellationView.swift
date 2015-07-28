//
//  ConstellationView.swift
//  EVE
//
//  Created by 杜艺卓 on 15/7/28.
//  Copyright © 2015年 MoShou. All rights reserved.
//

import UIKit

class ConstellationView: UIView {
    
    let virgoPoints: Array<(Int, Int)> = [(38, 185), (145, 261), (192, 331), (283, 358), (351, 283), (18, 265), (84, 315), (60, 358), (142, 425), (274, 440), (307, 492), (396, 520)]
    let virgoLines: Array<(Int, Int)> = [(0, 1), (1, 2), (2, 3), (3, 4), (5, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 11), (2, 8), (3, 9)]

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        
    }

}
