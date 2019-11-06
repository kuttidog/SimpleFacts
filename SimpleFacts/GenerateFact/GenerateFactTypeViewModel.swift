//
//  GenerateFactTypeViewModel.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 06/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation


protocol FactViewable {
    func dateService(dateSelected: String, monthSelected: String, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) ->())
    func numberService(entertedNumber: Int, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ())
}

class GenerateFactTypeViewModel: FactViewable {
   
    
    
    let service: FactServiceable
    init(service: FactServiceable) {
        self.service = service
    }
    
    convenience init () {
        self.init(service: FactService())
        
    }
    func dateService(dateSelected: String, monthSelected: String, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ()) {
        service.dateservice(dateSelected: dateSelected, monthSelected: monthSelected, typeOfInput: typeOfInput, completion: completion)
    }
    
    func numberService(entertedNumber: Int, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ()) {
        service.numberService(entertedNumber: entertedNumber, typeOfInput: typeOfInput, completion: completion)
    }
    
    
}
