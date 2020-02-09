//
//  Helper.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/2/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func saveAccessToken ( token : String ){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "access_token")
        def.synchronize()
        
        RestartApp()
    }
    
    class func getAccessToken () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "access_token")  as? String?)!
        
    }
}
