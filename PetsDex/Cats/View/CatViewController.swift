//
//  CatViewController.swift
//  PetsDex
//
//  Created by Katheryne Graf on 14/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit
import SVProgressHUD

class CatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK :- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK :- Variables
    var cats = [Cat]()
    var catPresenter = CatPresenter()
    
    // MARK :- Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        catPresenter.getAllBreeds { (cat) in
            if !cat.isEmpty{
                self.cats = cat
                self.tableView.reloadData()
            } else {
                let title = "A error ocurred!"
                let message = "An unknown problem occurred. Please check your internet connection"
                self.showAlert(title, message)
            }
        }
    }
    
    // MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return catPresenter.createCell(tableView, indexPath)
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = cats[indexPath.row]
        let catDetails = CatDetailsViewController()
        catDetails.cat = item
        self.present(catDetails, animated: true, completion: nil)
    }

    // MARK: - Actions
    @IBAction func btnBackToMain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
