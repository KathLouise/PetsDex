//
//  CatPresenter.swift
//  PetsDex
//
//  Created by Katheryne Graf on 16/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit
import SVProgressHUD

class CatPresenter: NSObject {
    //Cria um array vazio de Cats
    var cats = [Cat]()
    
    func getAllBreeds(completion: @escaping (_ response: [Cat]) -> Void){
        SVProgressHUD.show()
        CatDao.getCatsBreeds { (response) in
            SVProgressHUD.dismiss()
            if !response.cats.isEmpty{
                self.cats = response.cats
            }
            completion(self.cats)
        }
        
    }
    
    /* Pega uma celula da tabela com o identificador cell
     * Se ela não existir, então cria uma cela com o style
     * default e o identificador cell
     */
    func createCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = cats[indexPath.row].name
        return cell!
    }
    
}
