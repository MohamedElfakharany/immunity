//
//  authAPI.swift
//  IMMUNITY
//
//  Created by elfakharany on 7/31/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import Foundation
import Alamofire
class authAPI: NSObject {
    
    class func login(url: String,email: String,password: String, completion: @escaping(_ error: Error?,_ success: Bool, _ userData: Auth?)-> Void){
        
        let parameters = [
            "email": email,
            "password": password
        ]
        
        let headers = [
            "APP_KEY" : "123456",
            "Accept" : "application/json"
            
        ]
        
        print(url)
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON { (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    let login = try JSONDecoder().decode(Auth.self, from: response.data!)
                    if login.errorFlag == 1 {
                        completion(nil,true,login)
                    }else {
                        if url == URLs.login {
                            Helper.saveAccessToken(token: login.result?.token ?? "", role: "patient")
                        }else {
                            Helper.saveAccessToken(token: login.result?.token ?? "", role: "doctor")
                        }
                        
                        completion(nil,true,login)
                    }
                }catch{
                    print("error")
                }
            }
        }
    }
    
    
    
    class func register(first_name : String,last_name : String, email : String , password : String , phone : String, city : String, gander: String , date_of_birth : String , completion: @escaping(_ error: Error?,_ success: Bool, _ userData: Auth?)-> Void){
        
        let parameters = [
            "first_name" : first_name,
            "last_name": last_name,
            "email" :  email ,
            "password" : password,
            "phone":phone,
            "city":city,
            "gender": gander,
            "date_of_birth": date_of_birth
        ]
        
        let headers = [
            "APP_KEY" : "123456",
            "Accept" : "application/json",
            "Content-Type" : "application/json"
        ]
        
        let url = URLs.register
        
        print(url)
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON { (response) in
            
            switch response.result {
                
            case .failure(let error):
                completion(error, false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    let register = try JSONDecoder().decode(Auth.self, from: response.data!)
                    if register.errorFlag == 1 {
                        completion(nil,true,register)
                    }else {
                        Helper.saveAccessToken(token: register.result?.token ?? "" , role: "patient")
                        completion(nil,true,register)
                    }
                }catch{
                    print("error")
                }
            }
        }
    }
}




