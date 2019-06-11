//
//  ResponseCat.swift
//  PetsDex
//
//  Created by Katheryne Graf on 17/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import SwiftyJSON

class ResponseCat: BaseResponse {
    var cats: [Cat]!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    override init(fromJson json: JSON!){
        super.init(fromJson: json)
        
        cats = [Cat]()
        let catArray = json.arrayValue
        for catJson in catArray{
            let value = Cat(fromJson: catJson)
            cats.append(value)
        }
    }
}
