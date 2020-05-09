//
//  API+Auth.swift
//  IMMUNITY
//
//  Created by elfakharany on 12/2/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class API_Auth: NSObject {
    
    class func  login ( email : String , password : String , completion: @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let url = URLs.login
        
        let parameters = [
            "email" :  email ,
            "password" : password
        ]
        let headers = [
            "APP_KEY" : "123456",
            "Accept" : "application/json",
            "Content-Type" : "application/json"
            
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .responseJSON() { response in
                
                switch response.result{
                case .failure(let error):
                    completion(error ,  false)
                    print(" sorry login failed ")
                    print(error)
                case . success(let value):
                    print(" login successed ")
                    
                    print(value)
                    let json = JSON(value)
                    if let api_token =  json["data"]["access_token"].string {
                        Helper.saveAccessToken(token: api_token)
                        
                        print ("api_token : \(api_token) ")
                        
                        completion(nil,  true)
                    }
                    
                    if let FirstName = json["data"]["first_name"].string, let LastName = json["data"]["last_name"].string , let DateOfBirth = json["data"]["date_of_birth"].string , let Email = json["data"]["email"].string , let Phone = json["data"]["phone"].string , let City = json ["data"]["city"].string, let id = json["data"]["id"].string {
                        
                        Helper.SavePatientData(firstName: FirstName ,
                                               lastName: LastName,
                                               dateOfBirth: DateOfBirth,
                                               email: Email,
                                               phone: Phone,
                                               city : City,
                                               id : id, role: "patient" )
                        
                        completion( nil , true)
                        print("Patient Data firstName : \(FirstName) ")
                        print("Patient Data lastName : \(LastName) ")
                        print("Patient Data dateOfBirth : \(DateOfBirth) ")
                        print("Patient Data email : \(Email) ")
                        print("Patient Data phone : \(Phone) ")
                        print("Patient Data city : \(City) ")
                        print("Patient Data id : \(id) ")
                        
                    }
                    
                }
        }
    }
    
    class func register (first_name : String,last_name : String, email : String , password : String , phone : String, city : String, gander: String , date_of_birth : String,  completion: @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let url = URLs.register
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
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .responseJSON() { response in
                
                switch response.result{
                    
                case .failure(let error):
                    completion(error ,  false)
                    print(error)
                    print("register failed from request")
                    print(url)
                    print(parameters)
                case . success(let value):
                    print(value)
                    let json = JSON(value)
                    if let api_token = json["data"]["access_token"].string {
                        Helper.saveAccessToken(token: api_token)
                        completion(nil,  true)
                        print ("api_token : \(api_token) ")
                    }
                    if let FirstName = json["data"]["first_name"].string,
                        let LastName = json["data"]["last_name"].string ,
                        let DateOfBirth = json["data"]["date_of_birth"].string ,
                        let Email = json["data"]["email"].string ,
                        let Phone = json["data"]["phone"].string ,
                        let City = json ["data"]["city"].string,
                        let id = json["data"]["id"].string {
                        
                        Helper.SavePatientData(firstName: FirstName , lastName: LastName, dateOfBirth: DateOfBirth, email: Email, phone: Phone,city : City,id : id, role: "patient" )
                        print("Patient Data firstName : \(FirstName) ")
                        print("Patient Data lastName : \(LastName) ")
                        print("Patient Data dateOfBirth : \(DateOfBirth) ")
                        print("Patient Data email : \(Email) ")
                        print("Patient Data phone : \(Phone) ")
                        print("Patient Data city : \(City) ")
                        print("Patient Data id : \(id) ")
                        
                        completion(nil,  true)
                    }
                        print("register successed")
                }
        }
    }
    
    
    class func DoctorLogin ( email : String , password : String , completion: @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let url = URLs.DocLogin
        
        let parameters = [
            "email" :  email ,
            "password" : password
        ]
        let headers = [
            "APP_KEY" : "123456",
            "Accept" : "application/json",
            "Content-Type" : "application/json"
            
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .responseJSON() { response in
                
                switch response.result{
                case .failure(let error):
                    completion(error ,  false)
                    print(" sorry login failed ")
                    print(error)
                case . success(let value):
                    print(" login successed ")
                    
                    print(value)
                    let json = JSON(value)
                    if let api_token =  json["data"]["access_token"].string {
                        Helper.SaveDoctorAccessToken(token: api_token)
                        
                        print ("api_token : \(api_token) ")
                        
                        completion(nil,  true)
                    }
                    
                    if let FirstName = json["data"]["first_name"].string,
                        let LastName = json["data"]["last_name"].string ,
                        let DateOfBirth = json["data"]["date_of_birth"].string ,
                        let Email = json["data"]["email"].string ,
                        let PhoneNumber = json["data"]["phone_number"].string ,
                        let MobileNumber = json["data"]["mobile_number"].string,
                        let City = json ["data"]["city"].string,
                        let id = json["data"]["id"].string ,
                        let HospitalName = json["data"]["hospital_name"].string,
                        let Specialities = json["data"]["specialities"].string,
                        let Image = json["data"]["image"].string,
                        let Fees = json["data"]["fees"].string,
                        let Info = json["data"]["info"].string{
                        
                        Helper.SaveDoctorData (
                            firstName: FirstName ,
                            lastName: LastName,
                            dateOfBirth: DateOfBirth,
                            email: Email,
                            fees : Fees,
                            hospitalName : HospitalName,
                            image : Image,
                            phoneNumber: PhoneNumber,
                            MobileNumber : MobileNumber,
                            city : City,
                            id : id,
                            specialities: Specialities,
                            info: Info,
                            role: "doctor")
                        
                        print("Doctor Data firstName : \(FirstName) ")
                        print("Doctor Data lastName : \(LastName) ")
                        print("Doctor Data dateOfBirth : \(DateOfBirth) ")
                        print("Doctor Data email : \(Email) ")
                        print("Doctor Data phone Number : \(PhoneNumber) ")
                        print("Doctor Data city : \(City) ")
                        print("Doctor Data Fees : \(Fees) ")
                        print("Doctor Data Hospital Name : \(HospitalName) ")
                        print("Doctor Data Image : \(Image) ")
                        print("Doctor Data Mobile Number : \(MobileNumber) ")
                        print("Doctor Data Image : \(Image) ")
                        print("Doctor Data info : \(Info) ")
                        
                        completion( nil , true)
                        
                    }
                    
                }
        }
    }
    
    
    
    
    
    
    
    
}
