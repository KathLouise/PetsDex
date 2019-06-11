//
//  MainViewController.swift
//  PetsDex
//
//  Created by Katheryne Graf on 14/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var btnCats: UIButton!
    @IBOutlet weak var btnDogs: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnCats.layer.cornerRadius = 10
        btnDogs.layer.cornerRadius = 10
    }

    @IBAction func actionCats(_ sender: Any) {
        let catView = CatViewController()
        present(catView, animated: true, completion: nil)
        
    }
    
    @IBAction func actionDogs(_ sender: Any) {
        //let dogView = DogsViewController()
      //  present(dogView, animated: true, completion: nil)
    }
}

