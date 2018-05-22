//
//  Location.swift
//  ATMmvd
//
//  Created by Carolina Rocco on 22/5/18.
//  Copyright © 2018 Silvia Rocco. All rights reserved.
//

import UIKit

public class Location {

    public var longitud: Double?
    public var latitude: Double?
    
    init (lat: Double, lon: Double){
        self.latitude = lat
        self.longitud = lon
    }
}
