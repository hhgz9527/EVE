//
//  AppDelegate.swift
//  EVE
//
//  Created by 杜艺卓 on 15/7/25.
//  Copyright © 2015年 MoShou. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var player = AVPlayer(URL: NSBundle.mainBundle().URLForResource("bg", withExtension: "mp4")!)
    
    var bgLayer: AVPlayerLayer? = nil


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loopVideo:", name: AVPlayerItemDidPlayToEndTimeNotification, object: player.currentItem)
        
        
        bgLayer = AVPlayerLayer(player: player)
        bgLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        bgLayer?.frame = UIScreen.mainScreen().bounds
        
        self.window!.layer.insertSublayer(bgLayer!, below: self.window!.layer)
        
        
        player.play()
        // Override point for customization after application launch.
        return true
    }
    
    func loopVideo(notification: NSNotification) {
        let item = notification.object
        item?.seekToTime(kCMTimeZero)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
