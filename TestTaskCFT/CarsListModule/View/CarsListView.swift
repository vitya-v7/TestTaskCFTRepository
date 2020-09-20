//
//  CarsListView.swift
//  TestTask
//
//  Created by Viktor D. on 16.09.2020.
//  Copyright © 2020 Viktor D. All rights reserved.
//

import UIKit

protocol CarsListViewInput : UIViewController {
    func setInitialState()
    func setViewModels(viewModels: [CarsElementViewModel])
}

protocol CarsListViewOutput {
    func viewDidLoadDone()
    func cellWithIndexSelected(row: Int)
    func deleteButtonPressedWithIndexRow(row: Int)
    func plusButtonClicked()
    func viewWillAppearDone()
}

class CarsListView: UIViewController, CarsListViewInput, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var tableView: UITableView?
    
    var output: CarsListViewOutput?
    var maxCarNumber = 3
    var viewModels: [CarsElementViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewDidLoadDone()
    }
    
    func setInitialState() {
       let rightButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
       self.navigationItem.rightBarButtonItem = rightButton
       self.tableView?.delegate = self
       self.tableView?.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.viewWillAppearDone()
    }
    
    @objc func insertNewObject(_ sender: Any) {
        output!.plusButtonClicked()
    }
    
    func setViewModels(viewModels: [CarsElementViewModel]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.cellWithIndexSelected(row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsElementCell.reuseIdentifier) as! CarsElementCell
        cell.configureCell(withObject: viewModels![indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            output!.deleteButtonPressedWithIndexRow(row: indexPath.row)
        }
    }
}
