//
//  ResponseCatDetails.swift
//  PetsDex
//
//  Created by BRQ on 23/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import SwiftyJSON

class ResponseCatDetails: BaseResponse {
    var catDetails: [CatDetail]!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    override init(fromJson json: JSON!){
        super.init(fromJson: json)
        
        catDetails = [CatDetail]()
        let catArray = json.arrayValue
        for catJson in catArray{
            let value = CatDetail(fromJson: catJson)
            catDetails.append(value)
        }
    }
}
