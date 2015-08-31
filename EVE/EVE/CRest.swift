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

        Alamofire.request(Alamofire.Method.POST, "https://login.eveonline.com/oauth/token", parameters: params, encoding: ParameterEncoding.URL, headers: headers).responseJSON { (req, res, JSON) -> Void in
            
            print("\(JSON)", terminator: "\n")
        }
    }
    
    func refreshAuthToken() {
        let authStrBuff = CLIENT_ID + ":" + CLIENT_SECRET
        let authData = authStrBuff.dataUsingEncoding(NSUTF8StringEncoding)
        let authStr = authData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength).stringByReplacingOccurrencesOfString("\r\n", withString: "")
        print("\(authStr)", terminator: "\n")
        
        let headers = ["Authorization": "Basic " + authStr!,
            "Content-Type": "application/x-www-form-urlencoded",
            "Host": "login.eveonline.com"]
        
        let params = ["grant_type": "refresh_token",
            "refresh_token": "OyKJ-tsztZ3jzWvb5K7CGvDu5SoZZnD495LWMde-MDE1"]
        
        Alamofire.request(.POST, "https://login.eveonline.com/oauth/token", parameters: params, encoding: ParameterEncoding.URL, headers: headers).responseJSON { (req, res, JSON) -> Void in
            print("\(JSON)", terminator: "\n")
        }
    }
    
}