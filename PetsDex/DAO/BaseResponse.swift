//
//  BaseResponse.swift
//  PetsDex
//
//  Created by Katheryne Graf. on 17/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import SwiftyJSON

class BaseResponse{
    var success: Bool! = false
    var message: String! = "Houve um problema ao efetuar a requisição, verifique sua conexão e tente novamente."
    var token: String?
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        success = json["success"].boolValue
        message = json["message"].stringValue
        token = json["token"].stringValue
    }
}
