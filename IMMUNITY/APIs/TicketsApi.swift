//
//  TicketsApi.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/30/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Alamofire

class TicketsApi: NSObject {
    
    class func allTicketsByDoctorId(doc_Id: Int , completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: MainTicket?)-> Void){
        
        let headers = [
            "APP_KEY" : "123456"
        ]
        let parameters = [
            "doc_id" : doc_Id
        ]
        let url = URLs.ticketAll
        print(url)
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .responseJSON{ ( response ) in
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(error,false,false,nil)
                    
                case .success:
                    do{
                        print(response)
                        let showTickets = try JSONDecoder().decode(MainTicket.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                        
                        
                    }catch{
                        print("error")
                    }
                }
        }
        
    }
    
}
