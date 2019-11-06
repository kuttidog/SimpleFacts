//
//  YearViewModel.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 06/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation

protocol YearViewable {
    func getYearData(entertedNumber: Int, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ())
}


class YearViewModel: YearViewable {
    func getYearData(entertedNumber: Int, typeOfInput: String, completion: @escaping (FactModel?, ServiceError?) -> ()) {
        let service = FactService()
        service.numberService(entertedNumber: entertedNumber, typeOfInput: typeOfInput, completion: completion)
    }
    
    
    
}
