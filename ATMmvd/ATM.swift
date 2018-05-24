//
//  ATM.swift
//  ATMmvd
//
//  Created by Carolina Rocco on 18/5/18.
//  Copyright © 2018 Silvia Rocco. All rights reserved.
//

import Foundation
import ObjectMapper

class ATM: Mappable {
    
    required init?(map: Map) {
    }
    
    var id: Int?
    var location: Location?
    var address: String?
    var network: String?
    var status: String?
    var has_money: Bool?
    var accepts_deposits: Bool?
    var image: String?
    var open_hours: String?
    
    init (id: Int, location: Location, address: String, network: String, status: String, money: Bool, deposits: Bool, image:String, open_hours: String){
        self.id = id
        self.location = location
        self.address = address
        self.network = network
        self.status = status
        self.has_money = money
        self.accepts_deposits = deposits
        self.image = image
        self.open_hours = open_hours
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        location <- map["location"]
        address <- map["address"]
        network <- map["network"]
        status <- map["status"]
        has_money <- map["has_money"]
        accepts_deposits <- map["accepts_deposits"]
        image <- map["image_url"]
        open_hours <- map["open_hours"]
    }
    
}
