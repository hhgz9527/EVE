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

    @IBOutlet weak var priceWatchListLabel: MarqueeLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        priceWatchListLabel.scrollDuration = 10.0
        priceWatchListLabel.fadeLength = 25.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func requestAuth(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://login.eveonline.com/oauth/authorize?response_type=code&redirect_uri=eve%3A%2F%2Fcallback&client_id=97501bccc99b40b69b349dc7277621d8&scope=publicData")!)
    }
}

