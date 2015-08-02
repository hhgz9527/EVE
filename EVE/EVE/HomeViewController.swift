//
//  ViewController.swift
//  EVE
//
//  Created by 杜艺卓 on 15/7/25.
//  Copyright © 2015年 MoShou. All rights reserved.
//

import UIKit
import MarqueeLabel

class HomeViewController: UIViewController {

    @IBOutlet weak var characterView: HomeGradientView!
    @IBOutlet weak var priceWatchListLabel: HomeScrollLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        priceWatchListLabel.marqueeType = MarqueeType.MLContinuous
        priceWatchListLabel.animationDelay = 0
        priceWatchListLabel.scrollDuration = CGFloat((priceWatchListLabel.text?.characters.count)! / 5)
        priceWatchListLabel.fadeLength = 25.0
        priceWatchListLabel.leadingBuffer = 30.0
        priceWatchListLabel.trailingBuffer = 20.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func requestAuth(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://login.eveonline.com/oauth/authorize?response_type=code&redirect_uri=eveonline%3A%2F%2Fcallback&client_id=97501bccc99b40b69b349dc7277621d8&scope=publicData")!)
    }
}

