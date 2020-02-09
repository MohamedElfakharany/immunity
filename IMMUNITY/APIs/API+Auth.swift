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
    
    class func login ( email : String , password : String , completion: @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let url = URLs.login
        
        let parameters = [
            "email" :  email ,
            "password" : password
        ]
        let headers = [
            "APP_KEY" : "123456"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseJSON { response in
                
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
                        
                        completion(nil,  true)
                        print ("api_token : \(api_token) ")
                    }
                }
        }
    }
    
    class func register (first_name : String,last_name : String, email : String , password : String , phone : String, city : String,  completion: @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let url = URLs.register
        
        let parameters = [
            "first_name" : first_name,
            "last_name": last_name,
            "email" :  email ,
            "password" : password,
            "phone":phone,
            "city":city
        ]
        let headers = [
            "APP_KEY" : "123456"
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate (statusCode: 200..<300)
            .responseJSON { response in
                
                switch response.result{
                case .failure(let error):
                    completion(error ,  false)
                    print(error)
                    print("register failed")
                case . success(let value):
                    print("register successed")
                    let json = JSON(value)
                    if let api_token = json["data"]["access_token"].string {
                        
                        Helper.saveAccessToken(token: api_token)
                        
                        completion(nil,  true)
                        print ("api_token : \(api_token) ")
                    }
                }
        }
    }
    
    
}
