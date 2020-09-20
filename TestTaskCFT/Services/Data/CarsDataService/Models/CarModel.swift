//
//  CarModel.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

class CarModel: Codable {
    
    var carModel: String?
    var carCountry: String?
    var carYear: String?
    var carBodyStyle: String?
    var carKey: String?
    
    init(carModel: String, carCountry: String, carYear:String,
         carBodyStyle: String, key: String?) {
        self.carModel = carModel
        self.carCountry = carCountry
        self.carYear = carYear
        self.carBodyStyle = carBodyStyle
        self.carKey = key
    }
}
