//
//  API+UpdatePatientData.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/12/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_UpdatePatientData: NSObject {
    
    class func UpdatePatientData (first_name : String,last_name : String, email : String , phone : String, city : String,  completion: @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let url = URLs.UpdatePatientData
        
        let parameters = [
            "first_name" : first_name,
            "last_name": last_name,
            "email" :  email ,
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
                    print("Update Patient Data failed")
                case . success(let value):
                    print("Update Patient Data successed")
                    _ = JSON(value)
                    print(value)
                }
        }
    }
    
    class func UpdatePatientPassword (  password : String , completion: @escaping ( _ error : Error? , _ success : Bool)->Void) {
        
        let url = URLs.UpdatePatientPassword
        
        let parameters = [
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
                    print(error)
                    print("Update Patient Password failed")
                case . success(let value):
                    print("Update Patient Password successed")
                    _ = JSON(value)
                    print(value)
                }
        }
    }

}
