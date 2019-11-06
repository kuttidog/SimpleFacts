//
//  FactModel.swift
//  FactGenerator
//
//  Created by Kulanthaivel, Myl (.) on 04/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation


struct FactModel: Codable {
    var text: String
    var year: Int?
    var number: Int
    var found: Bool
    var type: String
}
