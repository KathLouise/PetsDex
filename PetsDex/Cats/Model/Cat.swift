//
//  Cat.swift
//  PetsDex
//
//  Created by Katheryne Graf on 14/05/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit
import SwiftyJSON

class Cat {
    var id: String!
    var name: String!
    var temperament: String!
    var life_span: String!
    var alt_names: String!
    var wikipedia_url: String!
    var origin: String!
    var weight_imperial: String!
    var country_code: String!
    var description: String!
    var experimental: Int! //min: 0, max: 1
    var hairless: Int! //min: 0, max: 1
    var natural: Int! //min: 0, max: 1
    var rare: Int! //min: 0, max: 1
    var rex: Int! //min:0, max: 1
    var suppress_tail: Int! //min: 0, max: 1
    var short_legs: Int! //min: 0, max: 1
    var hypoallergenic: Int! //min: 0, max:1
    var adaptability: Int! //min: 1, max: 5
    var affection_level: Int! //min: 1, max: 5
    var child_friendly: Int! //min: 1, max: 5
    var dog_friendly: Int! //min: 1, max: 5
    var energy_level: Int! //min: 1, max: 5
    var grooming: Int! //min: 1, max: 5
    var health_issues: Int! //min: 1, max: 5
    var intelligence: Int! //min: 1, max: 5
    var shedding_needs: Int! //min: 1, max: 5
    var social_needs: Int! //min: 1, max: 5
    var strange_friendly: Int! //min: 1, max: 5
    var vocalisation: Int! //min: 1, max: 5
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.temperament = json["temperament"].stringValue
        self.life_span = json["life_span"].stringValue
        self.alt_names = json["alt_names"].stringValue
        self.wikipedia_url = json["wikipedia_url"].stringValue
        self.origin = json["origin"].stringValue
        self.weight_imperial = json["weight_imperial"].stringValue
        self.country_code = json["country_code"].stringValue
        self.description = json["description"].stringValue
        self.experimental = json["experimental"].intValue
        self.hairless = json["hairless"].intValue
        self.natural = json["natural"].intValue
        self.rare = json["rare"].intValue
        self.rex = json["rex"].intValue
        self.suppress_tail = json["suppress_tail"].intValue
        self.short_legs = json["short_legs"].intValue
        self.hypoallergenic = json["hypoallergenic"].intValue
        self.adaptability = json["adaptability"].intValue
        self.affection_level = json["affection_level"].intValue
        self.child_friendly = json["child_friendly"].intValue
        self.dog_friendly = json["dog_friendly"].intValue
        self.energy_level = json["energy_level"].intValue
        self.grooming = json["grooming"].intValue
        self.health_issues = json["health_issues"].intValue
        self.intelligence = json["intelligence"].intValue
        self.shedding_needs = json["shedding_needs"].intValue
        self.social_needs = json["social_needs"].intValue
        self.strange_friendly = json["strange_friendly"].intValue
        self.vocalisation = json["vocalisation"].intValue
    }
}
