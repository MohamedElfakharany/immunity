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
        if Helper.getAccessToken().role == "patient" {
            
            print("Patient access_token is : \(Helper.GetPatientRole() ?? "")")
            
            let tab = UIStoryboard(name: "Patient", bundle: nil).instantiateViewController(withIdentifier: "TabBarVCs")
            
            window.rootViewController = tab
        }else if Helper.getAccessToken().role == "doctor" {
            let tab = UIStoryboard(name: "Doctor", bundle: nil).instantiateViewController(withIdentifier: "DTabBarVC")
            
            window.rootViewController = tab
        }
        UIView.transition(with: window, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
        
    }
    
    class func RestartDocApp(){
        guard let window = UIApplication.shared.keyWindow else {return}
        let sb = UIStoryboard ( name : "Doctor" , bundle : nil)
        var vc : UIViewController
        if getDoctorAccessToken() == nil {
            let StoryB = UIStoryboard ( name: "Patient", bundle: nil)
            vc = StoryB.instantiateViewController(withIdentifier: "NavigationFirstVC")
        }else {
            vc = sb.instantiateViewController(withIdentifier: "DAppointmentVC")
        }
        window.rootViewController = vc
        
        UIView.transition(with: window, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
    }
    
    class func saveId (ID : String){
        let def = UserDefaults.standard
        def.setValue(ID, forKey: "id")
        def.synchronize()
        
    }
    
    class func saveAccessToken ( token : String ,role: String){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "access_token")
        def.setValue(role, forKey: "role")
        def.synchronize()
        
        RestartApp()
    }
    
    class func SavePatientData (
        firstName : String ,
        lastName : String ,
        dateOfBirth : String ,
        email:String ,
        phone : String ,
        city : String,
        id : String,
        role : String
        ){
        
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
        
        let defId = UserDefaults.standard
        defId.setValue(id, forKey: "id")
        defId.synchronize()
        
        let defRole = UserDefaults.standard
        defRole.setValue(role, forKey: "role")
        defRole.synchronize()
        
        RestartApp()
        
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
    
    class func getAccessToken () -> (userToken: String? ,role: String?){
        let def = UserDefaults.standard
        return (def.object(forKey: "access_token")  as? String? ?? "",def.object(forKey: "role")  as? String? ?? "")
        
    }
    class func getPatientId() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "id") as? String?)!
    }
    
    class func GetPatientRole() -> String? {
        let def = UserDefaults.standard
        return (def.object(forKey: "role") as? String?)!
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
        
        let removeRole = UserDefaults.standard
        removeRole.removeObject(forKey: "role")
        removeRole.synchronize()
        
        RestartApp()
    }
    
    
    class func SaveDoctorAccessToken (token : String){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "access_token")
        def.synchronize()
        
        RestartDocApp()
    }
    class func SaveDoctorData(
        firstName : String ,
        lastName : String ,
        dateOfBirth : String ,
        email:String ,
        fees : String ,
        hospitalName : String ,
        image : String ,
        phoneNumber : String ,
        MobileNumber : String ,
        city : String ,
        id : String ,
        specialities : String ,
        info : String,
        role : String
        ){
        
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
        defPhone.setValue(phoneNumber, forKey: "phone")
        defPhone.synchronize()
        
        let defCity = UserDefaults.standard
        defCity.setValue(city, forKey: "city")
        defCity.synchronize()
        
        let defId = UserDefaults.standard
        defId.setValue(id, forKey: "id")
        defId.synchronize()
        
        let defFees = UserDefaults.standard
        defFees.setValue(fees, forKey: "fees")
        defFees.synchronize()
        
        let defSpeciality = UserDefaults.standard
        defSpeciality.setValue(specialities, forKey: "specialities")
        defSpeciality.synchronize()
        
        let defMobile = UserDefaults.standard
        defMobile.setValue(MobileNumber, forKey: "mobile_number")
        defMobile.synchronize()
        
        let defHospitalName = UserDefaults.standard
        defHospitalName.setValue(hospitalName, forKey: "hospital_name")
        defHospitalName.synchronize()
        
        let defInfo = UserDefaults.standard
        defInfo.setValue(info, forKey: "info")
        defInfo.synchronize()
        
        let defImage = UserDefaults.standard
        defImage.setValue(image, forKey: "image")
        defImage.synchronize()
        
        let defRole = UserDefaults.standard
        defRole.setValue(role, forKey: "role")
        defRole.synchronize()
        
        RestartDocApp()
        
    }
    
    class func getDoctorFirstName () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "first_name") as? String?)!
        
    }
    
    class func getDoctorLastName () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "last_name")  as? String?)!
        
    }
    
    class func getDoctorDateOfBirth () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "date_of_birth")  as? String?)!
        
    }
    
    class func getDoctorEmail () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "email")  as? String?)!
        
    }
    
    class func getDoctorPhone () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "phone_number")  as? String?)!
        
    }
    
    class func getDoctorCity () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "city")  as? String?)!
        
    }
    
    class func getDoctorAccessToken () -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "access_token")  as? String?)!
        
    }
    class func getDoctorId() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "id") as? String?)!
    }
    
    class func getDoctorFees() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "fees") as? String?)!
    }
    
    class func getDoctorHospitalName() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "hospital_name") as? String?)!
    }
    
    class func getDoctorMobileNumber() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "mobile_number") as? String?)!
    }
    
    class func getDoctorInfo() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "info") as? String?)!
    }
    
    class func getDoctorSpecialities() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "specialities") as? String?)!
    }
    
    class func getDoctorImage() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "image") as? String?)!
    }
    
    class func getDocRole() -> String?{
        let def = UserDefaults.standard
        return (def.object(forKey: "role")as? String?)!
    }
    
    class func removeDocAccessToken (){
        let removeSuccessful = UserDefaults.standard
        removeSuccessful.removeObject(forKey: "access_token")
        removeSuccessful.synchronize()
        
        RestartDocApp()
        
    }
    
    
}

