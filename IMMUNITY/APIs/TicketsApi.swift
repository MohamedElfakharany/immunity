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
    
    class func allTicketsByDoctorId(doc_Id: Int ,availability: String, completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: HeadTicket?)-> Void){
        
        let headers = HEADERS.headers
        
        let parameters = [
            "day_no" : "1" ,
            "doctor_id" : doc_Id ,
            "availability" : availability
            ] as [String : Any]
        let url = URLs.getTicket
        print(url)
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers )
            .responseJSON{ ( response ) in
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(error,false,false,nil)
                    
                case .success:
                    do{
                        print(response)
                        let showTickets = try JSONDecoder().decode(HeadTicket.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                        
                        
                    }catch{
                        print("error")
                    }
                }
        }
        
    }
    
    class func allTicketsByPatientId(Patient_Id: String ,availability: String, completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: HeadTicket?)-> Void){
        
        let headers = HEADERS.headers
        let parameters = [
            "patient_id" : Patient_Id ,
            "availability" : availability
            ] as [String : Any]
        let url = URLs.getTicket
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
                        let showTickets = try JSONDecoder().decode(HeadTicket.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                        
                        
                    }catch{
                        print("error")
                    }
                }
        }
        
    }
    
    class func confirmBooking(ticketId:String,docId : String , completion : @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllTickets :HeadMessage?)-> Void){
        

        let headers = HEADERS.headers
        let parameters = [
            "doctor_id" : docId,
            "payment" : "CASH",
            "ticket_id" : ticketId
        ]
        
        let url = URLs.patientBook
        print(url)
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .responseJSON{ ( response ) in
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(error,false,false,nil)
                    
                case .success:
                    do{
                        print(response)
                        let showTickets = try JSONDecoder().decode(HeadMessage.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                        
                        
                    }catch{
                        print("error")
                    }
                }
        }
        

    }
    
    
}
