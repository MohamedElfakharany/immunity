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
    
    class func allProducts(completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllDoctor :MainDoctors?)-> Void){
        
        let headers  = [
            "APP_KEY" : "123456"
        ]
        
        let url = URLs.doctorsAll
        print (url)
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: headers).responseJSON{ ( response ) in
            switch response.result
            {
            case .failure(let error):
                completion(error, false,false,nil)
                print(error)
            case .success:
                do{
                    print(response)
                    let showDoctors = try JSONDecoder().decode(MainDoctors.self, from: response.data!)
                    completion(nil,false,false,showDoctors)
                    
                }catch{
                    print("error")
                }
            }
            
        }
        
    }

}
