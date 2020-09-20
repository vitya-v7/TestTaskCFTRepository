//
//  CarDetailPresenter.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

class CarDetailPresenter: CarDetailViewOutput {
    
    var key: String?
    var carService: DetailsCarServiceInterface?
    var view: CarDetailViewInput?
    var carModel: CarModel?
    
    func viewDidLoadDone() {
    
        view?.setInitialState()
        if key != nil {
            carModel = carService?.getCar(key: key!)
        }
        else {
            carModel = CarModel.init(carModel: CarService.carModels[0], carCountry: CarService.carCountry[0], carYear: String(CarService.carYear[0]), carBodyStyle: CarService.carBodyStyle[0], key: nil)
        }
        
        reloadData()
    }
    
    func saveCarInDB() {
        if carModel!.carKey == nil {
            carService?.addCar(car: carModel!)
        }
        else {
            carService?.updateCar(car: carModel!)
        }
        self.view?.navigationController?.popViewController(animated: true)
    }
    
    func callPopover(fromView view: UIView, option: String) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let pv = storyboard.instantiateViewController(withIdentifier: "PickerViewIdentifier") as! PickerView
        pv.output = self
        pv.currentOption = option
        switch view.tag {
            case 1:
                pv.type = .carModel
            case 2:
                pv.type = .carBodyStyle
            case 3:
                pv.type = .carYear
            case 4:
                pv.type = .carCountry
        default:
            pv.type = .carModel
        }
        
        pv.modalPresentationStyle = UIModalPresentationStyle.popover
               pv.preferredContentSize = CGSize(width: 300, height: 300)
        pv.picker?.backgroundColor = UIColor.white
        pv.output = self
        self.view?.present(pv, animated: true, completion: nil)
        let popover = pv.popoverPresentationController
        popover?.permittedArrowDirections = .any
        popover?.sourceView = view
        popover?.sourceRect = (view.bounds)
    }
    
    func changeSelectedDataInView(type: pickerType, value: String) {
        switch type {
            case .carModel:
                carModel?.carModel = value
            case .carBodyStyle:
                carModel?.carBodyStyle = value
            case .carYear:
                carModel?.carYear = value
            case .carCountry:
                carModel?.carCountry = value
        }
        reloadData()
    }
    
    func reloadData() {
        view!.setViewModel(viewModel: CarDetailViewModel.init(withElementModel: carModel!))
    }
    
    func convertCarModelToViewModel(car: CarModel) -> CarDetailViewModel {
        let viewModel = CarDetailViewModel(withElementModel: car)
        return viewModel
    }
}
