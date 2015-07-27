//
//  CRest.swift
//  EVE
//
//  Created by 杜艺卓 on 15/7/25.
//  Copyright © 2015年 MoShou. All rights reserved.
//

import Foundation
import Alamofire


class CRest {
    
    static let sharedInstance = CRest()
    
    let CLIENT_ID = "97501bccc99b40b69b349dc7277621d8"
    let CLIENT_SECRET = "Ff8Ix2GEF2gJ83Rj4CwaJ1Vl5dGxWOr0Q3hbdndf"
    
    var refresh_token = ""
    var access_token = ""
    
    var authManager, authVerificationManager, authRenewManager, CRESTManager: Manager?
    
    func verifyAuthCode(code: String) {
        
//        Encoding Authorization String
        let authStrBuff = CLIENT_ID + ":" + CLIENT_SECRET
        let authData = authStrBuff.dataUsingEncoding(NSUTF8StringEncoding)
        let authStr = authData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding76CharacterLineLength).stringByReplacingOccurrencesOfString("\r\n", withString: "")
        
        let headers = ["Authorization": "Basic " + authStr!,
        "Content-Type": "application/x-www-form-urlencoded",
            "Host": "login.eveonline.com"]
        
        let params = ["grant_type": "authorization_code",
        "code": code]
        
        var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders as! [String: String]
        for (key, value) in headers {
            defaultHeaders[key] = value
        }
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        config.HTTPAdditionalHeaders = defaultHeaders
        authManager = Alamofire.Manager(configuration: config)
        print("\(authManager!.session.configuration.HTTPAdditionalHeaders)", appendNewline: true)
        
        authManager!.request(.POST, "https://login.eveonline.com/oauth/token", parameters: params, encoding: ParameterEncoding.URL).responseJSON { (req, res, JSON, err) -> Void in
            if let e = err {
                print("Error: \(e.description)", appendNewline: true)
            }
            
            print("\(JSON)", appendNewline: true)
        }
    }
    
    func refreshAuthToken() {
        let authStrBuff = CLIENT_ID + ":" + CLIENT_SECRET
        let authData = authStrBuff.dataUsingEncoding(NSUTF8StringEncoding)
        let authStr = authData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength).stringByReplacingOccurrencesOfString("\r\n", withString: "")
        print("\(authStr)", appendNewline: true)
        
        let headers = ["Authorization": "Basic " + authStr!,
            "Content-Type": "application/x-www-form-urlencoded",
            "Host": "login.eveonline.com"]
        
        //        print("Access token: \(access_token) hahahahaha", appendNewline: true)
        let params = ["grant_type": "refresh_token",
            "refresh_token": "OyKJ-tsztZ3jzWvb5K7CGvDu5SoZZnD495LWMde-MDE1"]
        
        Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = headers
        Alamofire.request(.POST, URLString: "https://login.eveonline.com/oauth/token", parameters: params).responseJSON { (req, res, JSON, err) -> Void in
            print("\(JSON)", appendNewline: true)
        }
    }
    
}