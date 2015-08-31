//
//  URLParser.swift
//  EVE
//
//  Created by 杜艺卓 on 15/7/26.
//  Copyright © 2015年 MoShou. All rights reserved.
//

import Foundation


class URLParser {
    static let sharedInstance = URLParser()
    
    func parseScheme(url: NSURL) ->Bool {
        var authCode = ""
        
        if let params = url.query {
            
            for param in params.componentsSeparatedByString("&") {
                
                let pair = param.componentsSeparatedByString("=")
                
                if pair[0] == "code" {
                    authCode = pair[1]
                    print("Code: \(authCode)", terminator: "\n")
                    CRest.sharedInstance.verifyAuthCode(authCode)
                }
            }
        }
        
        return true
    }
}