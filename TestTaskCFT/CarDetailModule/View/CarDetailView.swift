//
//  CarDetailView.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 18.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol CarDetailViewInput : UIViewController  {
    func setInitialState()
    func setViewModel(viewModel: CarDetailViewModel)
}

protocol CarDetailViewOutput {
    func callPopover(fromView: UIView, option: String)
    func changeSelectedDataInView(type: pickerType, value: String)
    func viewDidLoadDone()
    func saveCarInDB()
}

class CarDetailView: UIViewController, CarDetailViewInput, UITextFieldDelegate {
    
    var output: CarDetailViewOutput?
    var viewModel: CarDetailViewModel?
    
    @IBOutlet weak var carModel: UITextField!
    @IBOutlet weak var carYear: UITextField!
    @IBOutlet weak var carCountry: UITextField!
    @IBOutlet weak var carBodyStyle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoadDone()
    }
    
    @objc func saveCar(_ sender: Any) {
        output!.saveCarInDB()
    }
    
    func setInitialState() {
       let rightButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveCar(_:)))
       self.navigationItem.rightBarButtonItem = rightButton
       carModel.delegate = self
       carCountry.delegate = self
       carBodyStyle.delegate = self
       carYear.delegate = self
    }
   
    func setViewModel(viewModel: CarDetailViewModel) {
        self.viewModel = viewModel
        self.configureDetailView(withObject: viewModel)
    }
       
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if output != nil  {
            output?.callPopover(fromView: textField, option: textField.text!)
            return false
        }
        return true
    }
    
    private func configureDetailView(withObject object: CarDetailViewModel) {
        self.carModel!.text = object.carModel
        self.carYear!.text = object.carYear
        self.carCountry!.text = object.carCountry
        self.carBodyStyle!.text = object.carBodyStyle
    }
}

