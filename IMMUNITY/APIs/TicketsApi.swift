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
    
    class func allTicketsByDoctorId(doc_Id: Int , completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: HeadTicket?)-> Void){
        
        let headers = HEADERS.headersPatient
        
        let parameters = [
            "day_no" : "1" ,
            "doctor_id" : doc_Id
            ] as [String : Any]
        let url = URLs.getTicket
        print(url)
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers )
            .responseJSON{ ( response ) in
                switch response.result {
                case .failure(let error):
                    print(error)
                    print("error failure")
                    completion(error,false,false,nil)
                    
                case .success:
                    do{
                        let showTickets = try JSONDecoder().decode(HeadTicket.self, from: response.data!)
                        print(response)
                        completion(nil,true,true,showTickets)
                        
                        
                    }catch{
                        print("error from catch in allTicketsByDoctorId")
                    }
                }
        }
        
    }
    
    class func allTicketsUPCOMING( completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: HeadBookings?)-> Void){
        
        let headers = HEADERS.headersPatient
        
        let parameters = [
            "status" : "UPCOMING"
        ]
        
        let url = URLs.getBookings
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
                        let showTickets = try JSONDecoder().decode(HeadBookings.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                        
                        
                    }catch{
                        print("error from catch in allTicketsUPCOMING")
                    }
                }
        }
        
    }
    
    
    class func allTicketsByLAST( completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: HeadBookings?)-> Void){
        
        let headers = HEADERS.headersPatient
        
        let parameters = [
            "status" : "LAST"
        ]
        
        let url = URLs.getBookings
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
                        let showTickets = try JSONDecoder().decode(HeadBookings.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                    }catch{
                        print("error from catch in allTicketsByLAST")
                    }
                }
        }
    }
    
    class func confirmBooking(ticketId:String,docId : String , completion : @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllTickets :HeadMessage?)-> Void){
        
        
        let headers = HEADERS.headersPatient
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
                        print("error from catch in confirmBooking")
                    }
                }
        }
    }
    
    
    class func DocAllTicketsUPCOMING( completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: HeadBookings?)-> Void){
        let headers = HEADERS.headersDoctor
        let parameters = [
            "status" : "UPCOMING"
        ]
        let url = URLs.getDocTickets
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
                        let showTickets = try JSONDecoder().decode(HeadBookings.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                    }catch{
                        print("error from catch in DocAllTicketsUPCOMING")
                    }
                }
        }
        
    }
    
    class func DocAllTicketsGrtBookings( completion: @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSuccess: Bool, _ AllTicket: HeadBookings?)-> Void){
        let headers = HEADERS.headersDoctor
        let parameters = [
            "status" : "UPCOMING"
        ]
        let url = URLs.getDocBookings
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
                        let showTickets = try JSONDecoder().decode(HeadBookings.self, from: response.data!)
                        completion(nil,true,true,showTickets)
                    }catch{
                        print("error from catch in DocAllTicketsGrtBookings")
                    }
                }
        }
        
    }
    
    
    class func AddTickets(dayID: Int , from : String , to : String , completion : @escaping(_ error: Error?,_ networkSuccess: Bool,_ codeSucess: Bool ,_ AllTickets :HeadMessage?)-> Void){
        
        
        let headers = HEADERS.headersDoctor
        let parameters = [
            "day": dayID,
            "from": from,
            "to": to
            ] as [String : Any]
        
        let url = URLs.addTicket
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
                        print("error from catch in confirmBooking")
                    }
                }
        }
    }
    
}
