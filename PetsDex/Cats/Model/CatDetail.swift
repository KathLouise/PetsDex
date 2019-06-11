//
//  CatDetail.swift
//  PetsDex
//
//  Created by Katheryne Graf on 20/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import SwiftyJSON

class CatDetail{
    var id: String!
    var url: String!
    var width: Int!
    var height: Int!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        
        self.id = json["id"].stringValue
        self.url = json["url"].stringValue
        self.width = json["width"].intValue
        self.height = json["height"].intValue
    }
}
