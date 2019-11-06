
//
//  DateViewModel.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 06/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation

protocol DateViewable {
   func getDateData(dateSelected: String, monthSelected: String, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) ->())
    
}

class DateViewModel: DateViewable {
    func getDateData(dateSelected: String, monthSelected: String, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ()) {
        let service = FactService()
        service.dateservice(dateSelected: dateSelected, monthSelected: monthSelected, typeOfInput: typeOfInput, completion: completion)
    }
}
