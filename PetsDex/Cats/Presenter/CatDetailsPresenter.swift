//
//  CatDetailsPresenter.swift
//  PetsDex
//
//  Created by Katheryne Graf on 17/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import SVProgressHUD

class CatDetailsPresenter{
    var catDetails = [CatDetail]()
    
    func getCatImage(_ breed_id: String, completion: @escaping (_ response: [CatDetail]) -> Void){
        SVProgressHUD.show()
        CatDao.getImage(breed_id) { (response) in
            SVProgressHUD.dismiss()
            if !response.catDetails.isEmpty{
                self.catDetails = response.catDetails
            }
            completion(self.catDetails)
        }
        
    }
}
