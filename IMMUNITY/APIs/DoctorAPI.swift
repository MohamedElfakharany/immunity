//
//  DoctorAPI.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/8/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Alamofire

class DoctorAPI: NSObject {
    
    class func allDoctors(page: Int, completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllDoctor :HeadDoctor?)-> Void){
        
        let headers  = HEADERS.headersPatient
        
        let parameters = [
            "city" : "",
            "specialities" : "",
            "page":  page
            ] as [String : Any]
        
        let url = URLs.getDoctor
        print (url)
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON{ ( response ) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil)
                print(error)
            case .success:
                do{
                    //print("DoctorAPI Response \(response)")
                    let showDoctors = try JSONDecoder().decode(HeadDoctor.self, from: response.data!)
                    completion(nil,true,true,showDoctors)
                    //print ("DoctorAPI showDoctors \(showDoctors) ")
                }catch{
                    print("error")
                }
            }
            
        }
        
    }
    
    
    class func allDoctorsByAreaAndSpeciality(city: String,speciality: String,page: Int, completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllDoctor :HeadDoctor?)-> Void){
        
        let headers  = HEADERS.headersPatient
        
        let parameters = [
            
            "specialities": speciality,
            "city":city,
            "page":  page
            ] as [String : Any]
        
        let url = URLs.getDoctor
        print (url)
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON{ ( response ) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    print(parameters)
                    let showDoctors = try JSONDecoder().decode(HeadDoctor.self, from: response.data!)
                    completion(nil,true,true,showDoctors)
                    
                }catch{
                    print("error")
                }
            }
            
        }
        
    }
    
    
    class func getDocProfile( completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool,_ TheDoctor: GetDocProfile?)-> Void){
        
        let headers = HEADERS.headersDoctor
        
        let url = URLs.getDocProfile
        
        print(url)
        print(headers)
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: headers).responseJSON { (response) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    let showDoctor = try JSONDecoder().decode(GetDocProfile.self, from: response.data!)
                    completion(nil,true,true,showDoctor)
                    
                }catch{
                    print("error")
                }
            }
            
        }
        
        }
    
    
}
