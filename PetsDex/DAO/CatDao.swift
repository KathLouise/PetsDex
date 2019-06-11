//
//  CatDao.swift
//  PetsDex
//
//  Created by Katheryne Graf on 16/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CatDao: NSObject {
    static func getCatsBreeds (completion: @escaping (_ response: ResponseCat) -> Void){
        let headers: HTTPHeaders = [
            "x-api-key": "5045db16-596f-4cd0-8404-f2a5709a3f6c",
            "Accept": "application/json"
        ]
        
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else { return }
        
        Alamofire.request(url, headers: headers)
            .responseJSON { response in
                response.debugLog()
                switch response.result {
                case .success:
                    let json = JSON(response.result.value as Any)
                    let response = ResponseCat(fromJson: json)
                    completion(response)
                case .failure:
                    print("Error ocurred")
                }
                
        }
    }
    
    static func getImage(_ breed_id: String, completion: @escaping (_ response: ResponseCatDetails) -> Void) {
        let headers: HTTPHeaders = [
            "x-api-key": "5045db16-596f-4cd0-8404-f2a5709a3f6c",
            "Accept": "application/json"
        ]
        
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?") else { return }
        Alamofire.request(url, method: .get, parameters: ["breed_id": breed_id], encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                response.debugLog()
                switch response.result {
                case .success:
                    let json = JSON(response.result.value as Any)
                    let response = ResponseCatDetails(fromJson: json)
                    completion(response)
                case .failure:
                    print("Error ocurred")
                }
                
        }
        
    }
    
}


