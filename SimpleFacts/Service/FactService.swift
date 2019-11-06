//
//  DateFactService.swift
//  FactGenerator
//
//  Created by Kulanthaivel, Myl (.) on 04/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

enum ServiceError: Error {
    case networkIssue(Error)
    case emptyResponse
    case decodingError
    case serviceError(String?)
    case unknown
    
    func errorMessage() -> String {
        switch self {
        case .networkIssue(let error):
            return error.localizedDescription
        case .emptyResponse:
            return "Response was empty"
        case .decodingError:
            return "Couldn't decode the response"
        case .serviceError(let message):
            return "\(message) FactServicewent wrong!"
        case .unknown:
            return "Catch Issue"
        }
    }
}

import Foundation

protocol FactServiceable {
    func dateservice(dateSelected: String, monthSelected: String, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) ->())
    func numberService(entertedNumber: Int, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ())
}

class FactService: FactServiceable {

    
    let headers = [
                    "x-rapidapi-host": "numbersapi.p.rapidapi.com",
                    "x-rapidapi-key": "8d556e9417msh0ec350d88d58f9dp1cc784jsna0aeae7a035c"]
    let baseURL =   "https://numbersapi.p.rapidapi.com"

func dateservice(dateSelected: String, monthSelected: String, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ()) {
let request = NSMutableURLRequest(
    url: NSURL(string: "\(baseURL)/\(monthSelected)/\(dateSelected)/\(typeOfInput)?fragment=true&json=true")! as URL,
    cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    
    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
        if let error = error {
        completion(nil, ServiceError.networkIssue(error))
        return
    }
        
    guard let data = data else {
        completion(nil, ServiceError.emptyResponse) //serviceResponse -> switch case
        return
    }
    
    do {
        let factResults = try JSONDecoder().decode(FactModel.self, from: data)
        completion(factResults, nil)
    }
    catch {
            completion(nil, ServiceError.decodingError)
        }
}).resume()

}
    
    func numberService(entertedNumber: Int, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ()) {
        let request = NSMutableURLRequest(
            url: NSURL(string: "\(baseURL)/\(entertedNumber)/\(typeOfInput)?fragment=true&json=true")! as URL,
            cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            if let error = error {
                completion(nil, ServiceError.networkIssue(error))
                return
            }
            
            guard let data = data else {
                completion(nil, ServiceError.emptyResponse) //serviceResponse -> switch case
                return
            }
            
            do {
                let factResults = try JSONDecoder().decode(FactModel.self, from: data)
                completion(factResults, nil)
            }
            catch {
                completion(nil, ServiceError.decodingError)
            }
        }).resume()
        
    }
    
    
}


