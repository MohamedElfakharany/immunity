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
    
    class func saveId (ID : String){
        let def = UserDefaults.standard
        def.setValue(ID, forKey: "id")
        def.synchronize()
        
    }
    
    class func saveAccessToken ( token : String ){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "access_token")
        def.synchronize()
        
        RestartApp()
    }
    
    class func SavePatientData (firstName : String ,lastName : String , dateOfBirth : String , email:String , phone : String , city : String){
        let defFirstName = UserDefaults.standard
        defFirstName.setValue(firstName, forKey: "first_name")
        defFirstName.synchronize()
        
        let defLastName = UserDefaults.standard
        defLastName.setValue(lastName, forKey: "last_name")
        defLastName.synchronize()
        
        let defDateOfBirth = UserDefaults.standard
        defDateOfBirth.setValue(dateOfBirth, forKey: "date_of_birth")
        defDateOfBirth.synchronize()
        
        let DefEmail = UserDefaults.standard
        DefEmail.setValue(email, forKey: "email")
        DefEmail.synchronize()
        
        let defPhone = UserDefaults.standard
        defPhone.setValue(phone, forKey: "phone")
        defPhone.synchronize()
        
        let defCity = UserDefaults.standard
        defCity.setValue(city, forKey: "city")
        defCity.synchronize()
        
    }
    
    
    class func getPatientFirstName () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "first_name") as? String?)!
        
    }
    
    class func getPatientLastName () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "last_name")  as? String?)!
        
    }
    
    class func getPatientDateOfBirth () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "date_of_birth")  as? String?)!
        
    }
    
    class func getPatientEmail () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "email")  as? String?)!
        
    }
    
    class func getPatientPhone () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "phone")  as? String?)!
        
    }
    
    class func getPatientCity () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "city")  as? String?)!
        
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
    class func removePatientData (){
        let removeFName = UserDefaults.standard
        removeFName.removeObject(forKey: "first_name")
        removeFName.synchronize()
        
        let removeLName = UserDefaults.standard
        removeLName.removeObject(forKey: "last_name")
        removeLName.synchronize()
        
        let removeDateOfBirth = UserDefaults.standard
        removeDateOfBirth.removeObject(forKey: "date_of_birth")
        removeDateOfBirth.synchronize()
        
        let removeEmail = UserDefaults.standard
        removeEmail.removeObject(forKey: "email")
        removeEmail.synchronize()
        
        let removePhone = UserDefaults.standard
        removePhone.removeObject(forKey: "phone")
        removePhone.synchronize()
        
        let removeCity = UserDefaults.standard
        removeCity.removeObject(forKey: "city")
        removeCity.synchronize()
        
        RestartApp()
    }
}

