//
//  Helper.swift
//  IMMUNITY
//
//  Created by elfakharany on 12/6/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class func RestartApp(){
        guard let window = UIApplication.shared.keyWindow else {return}
        let sb = UIStoryboard ( name : "Patient" , bundle : nil)
        var vc : UIViewController
        if getAccessToken() == nil {
            vc = sb.instantiateInitialViewController()!
        }else {
            vc = sb.instantiateViewController(withIdentifier: "TabBarVCs")
        }
        window.rootViewController = vc
        
        UIView.transition(with: window, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
        
    }
    
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
    
    class func removeAccessToken (){
        let removeSuccessful = UserDefaults.standard
        removeSuccessful.removeObject(forKey: "access_token")
        removeSuccessful.synchronize()
        
        RestartApp()
        
    }
}

