//
//  CarsElementCell.swift
//  TestTaskCFT
//
//  Created by Viktor D. on 17.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

class CarsElementCell: UITableViewCell {
    
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carYear: UILabel!
    @IBOutlet weak var carCountry: UILabel!
    @IBOutlet weak var carBodyStyle: UILabel!
    var viewModel: CarsElementViewModel?
    
    static let reuseIdentifier = "CarsListCellIdentifier"
    
    func configureCell(withObject object: CarsElementViewModel) {
        viewModel = object
        self.carModel!.text = "Model: " + object.carModel!
        self.carYear!.text = "Year: " + object.carYear!
        self.carBodyStyle!.text = "Body Style: " + object.carBodyStyle!
        self.carCountry!.text = "Country: " + object.carCountry!
    }
    
    override func prepareForReuse() {
        self.carModel!.text = nil
        self.carYear!.text = nil
        self.carBodyStyle!.text = nil
        self.carCountry!.text = nil
    }
}
