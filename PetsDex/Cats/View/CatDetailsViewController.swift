//
//  CatDetailsViewController.swift
//  PetsDex
//
//  Created by BRQ on 17/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class CatDetailsViewController: UIViewController {
    var myView = UIView()
    var imageCat = UIImageView()
    
    var navBar : UINavigationBar!
    var labelTitle: UILabel!
    var labelLife: UILabel!
    var textLife: UILabel!
    var labelOrigin: UILabel!
    var textOrigin: UILabel!
    var labelTemperament: UILabel!
    var textTemperament: UILabel!
    var labelDescription: UILabel!
    var textDescription: UILabel!
    
    var cat: Cat!
    var catDetail = [CatDetail]()
    var catDetailsPresenter = CatDetailsPresenter()
    
    // MARK :- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        catDetailsPresenter.getCatImage(cat.id) { (detail) in
            if !detail.isEmpty{
                self.catDetail = detail
            } else {
                let title = "A error ocurred!"
                let message = "An unknown problem occurred. Please check your internet connection"
                self.showAlert(title, message)
            }
            self.setImage()
        }
    }
    
    // MARK :- Setups
    
    /*
     * Cria a view
     */
    func setupView(){
        let screenSize: CGRect = UIScreen.main.bounds
        myView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height:screenSize.height))
        self.view.addSubview(myView)
        myView.backgroundColor = .white
    }
    
    /*
     * Cria a navbar
     * Pega a posição inicial do Y dentro da safe area, para criar a navbar dentro da safe area
     * Adiciona o botão de done do lado esquerdo da tela
     */
    func setNavBar(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        navBar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: myView.bounds.width, height: 150))
        myView.addSubview(navBar)
        
        let navItem = UINavigationItem(title: cat.name)
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(closeAction))
        navItem.leftBarButtonItem = doneItem
        
        navBar.setItems([navItem], animated: false)
    }
    
    func setImage(){
        imageCat = UIImageView(frame: CGRect(x: 10, y: navBar.frame.height, width: 300, height: 300))
        imageCat.contentMode = .scaleToFill
        
        let url = URL(string: catDetail[0].url)
        if let data = try? Data(contentsOf: url!){
            imageCat.image = UIImage(data: data)
        }
        
        myView.addSubview(imageCat)
        //setConstraits()
    }
    
    
    // MARK :- Constraints
    
    func setConstraits(){
        let centerXConst = NSLayoutConstraint(item: imageCat, attribute: .centerX, relatedBy: .equal, toItem: myView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYConst = NSLayoutConstraint(item: imageCat, attribute: .centerY, relatedBy: .equal, toItem: myView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        let heightConstraint = NSLayoutConstraint(item: imageCat, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 185.0)
        let widthConstraint = NSLayoutConstraint(item: imageCat, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width / 2)
        imageCat.addConstraints([heightConstraint, widthConstraint])
        
        NSLayoutConstraint.activate([centerXConst, centerYConst])
    }
    
    // MARK :- Actions
    
    @objc func closeAction(){
        dismiss(animated: true, completion: nil)
    }

}
