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
    
    class func allDoctors(page: Int, completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllDoctor :MainDoctors?, _ page : Int)-> Void){
        
        let headers  = [
            "APP_KEY" : "123456"
        ]
        
        let parameters = [
            "page":  page
        ]
        
        let url = URLs.doctorsAll
        print (url)
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON{ ( response ) in
            switch response.result
            {
            case .failure(let error):
                
                completion(error, false,false,nil,page)
                print(error)
            case .success:
                do{
                    print(response)
                    let showDoctors = try JSONDecoder().decode(MainDoctors.self, from: response.data!)
                    print("before")
                    let Last_page = showDoctors.meta?.lastPage ?? page
                    completion(nil,true,true,showDoctors,Last_page)
                    print("after")
                }catch{
                    print("error")
                }
            }
            
        }
        
    }
    
    

}
