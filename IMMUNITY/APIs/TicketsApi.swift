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
    
    class func allTicketsByDoctorId(doc_Id: Int ,availability: String, completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: MainTicket?)-> Void){
        
        let headers = [
            "APP_KEY" : "123456"
        ]
        let parameters = [
            "doc_id" : doc_Id ,
            "availability" : availability
            ] as [String : Any]
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
    
    class func allTicketsByPatientId(Patient_Id: String ,availability: String, completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: MainTicket?)-> Void){
        
        let headers = [
            "APP_KEY" : "123456"
        ]
        let parameters = [
            "patient_id" : Patient_Id ,
            "availability" : availability
            ] as [String : Any]
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
    
    class func confirmBooking(ticketId:String,docId : String , Availability : String, completion : @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllTickets :Message?)-> Void){
        
        guard let PatientId = Helper.getPatientId() else {
            completion(nil, false,false, nil)
            return
        }
        let headers = [
            "APP_KEY" : "123456"
        ]
        let parameters = [
            "doc_id" : docId,
            "patient_id" : PatientId,
            "availability" : Availability
        ]
        
        let url = URLs.ticketAll + ticketId
        print(url)
        print(parameters)
        
        Alamofire.request(url, method: .patch, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .responseJSON{ ( response ) in
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(error,false,false,nil)
                    
                case .success:
                    do{
                        print(response)
                        let showTickets = try JSONDecoder().decode(Message.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                        
                        
                    }catch{
                        print("error")
                    }
                }
        }
        

    }
    
    
}
