//
//  ModulesFactory.swift
//  TestTaskCFT
//
//  Created by Admin on 17.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ModulesFactory {
    class func createCarsListModule() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(identifier: "CarsListViewIdentifier") as! CarsListView
        let carService = CarService.init()
        let presenter = CarsListPresenter()
        
        view.output = presenter
        presenter.view = view
        presenter.carService = carService
        return view
    }
    
    class func createCarDetailModule(key: String?) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "CarDetailViewIdentifier") as! CarDetailView
        let carService = CarService.init()
        
        let presenter = CarDetailPresenter()
        view.output = presenter
        presenter.view = view
        presenter.key = key        
        presenter.carService = carService
        return view
    }
}
