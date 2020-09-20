//
//  CarsListPresenter.swift
//  TestTask
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

class CarsListPresenter: CarsListViewOutput {
    
    var carService: CarsListServiceInterface?
    var view: CarsListViewInput?
    var carModels: [CarModel]?
    
    func convertCarModelToViewModel(car: CarModel) -> CarsElementViewModel {
        let viewModel = CarsElementViewModel(withElementModel: car)
        return viewModel
    }
    
    func viewDidLoadDone() {
        view?.setInitialState()
    }
    
    func viewWillAppearDone() {
        self.reloadData();
    }
    
    func convertModelsToViewModels(models: [CarModel]) -> [CarsElementViewModel] {
        var carCells = [CarsElementViewModel]()
        
        for car in models {
            carCells.append(CarsElementViewModel.init(withElementModel: car))
        }
        return carCells
    }
    
    func cellWithIndexSelected(row: Int) {
        let carModelKey = carModels![row].carKey!
        self.view?.navigationController?.pushViewController(ModulesFactory.createCarDetailModule(key: carModelKey), animated: true)
    }
    
    func plusButtonClicked() {
        self.view?.navigationController?.pushViewController(ModulesFactory.createCarDetailModule(key: nil), animated: true)
    }
    
    func reloadData() {
        carModels = carService?.getCars()
        view!.setViewModels(viewModels: convertModelsToViewModels(models: carModels!))
    }
    
    func deleteButtonPressedWithIndexRow(row: Int) {
        carService?.deleteCar(key: carModels![row].carKey!)
        reloadData()
    }
}
