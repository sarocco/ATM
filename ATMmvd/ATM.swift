//
//  ATM.swift
//  ATMmvd
//
//  Created by Carolina Rocco on 18/5/18.
//  Copyright © 2018 Silvia Rocco. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreLocation

class ATM: NSObject, Mappable{
    var id: Int?
    var location: CLLocationCoordinate2D?
    var address: String?
    var network: String?
    var status: String?
    var has_money: Bool?
    var accepts_deposits: Bool?
    var image: String?
    var open_hours: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        location <- map["location"]
        address <- map["address"]
        network <- map["network"]
        status <- map["status"]
        has_money <- map["has_money"]
        accepts_deposits <- map["accepts_deposits"]
        image <- map["image"]
        open_hours <- map["open_hours"]
    }
    
}