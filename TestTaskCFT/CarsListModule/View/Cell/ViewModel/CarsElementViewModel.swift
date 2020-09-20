//
//  CarsElementViewModel.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

class CarsElementViewModel {
    
    var carModel: String?
    var carYear: String?
    var carCountry: String?
    var carBodyStyle: String?
    
    init (withElementModel model: CarModel) {
        self.carModel = model.carModel
        self.carCountry = model.carCountry
        self.carBodyStyle = model.carBodyStyle
        self.carYear = model.carYear
        
    }
}
