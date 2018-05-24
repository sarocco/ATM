//
//  CustomAnnotation.swift
//  ATMmvd
//
//  Created by Carolina Rocco on 23/5/18.
//  Copyright © 2018 Silvia Rocco. All rights reserved.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var atm: ATM
    var iconName:String
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: (atm.location?.latitude)!, longitude: (atm.location?.longitud)!)
        }
    }
    
    var title: String? {
        get {
            return atm.address
        }
    }
    
    var subtitle: String? {
        get {
            var money: String?
            var deposit: String?
            
            if atm.has_money!{
                money = "Has Money"
            } else {
                money = "No Money"
            }
            if atm.accepts_deposits!{
                deposit = "Deposits"
            }else{
                deposit = "No Deposits"
            }
            return money! + " | " + deposit!
        }
    }
    
    init(atm: ATM, iconName: String) {
        self.atm = atm
        self.iconName = iconName
        super.init()
    }
}
