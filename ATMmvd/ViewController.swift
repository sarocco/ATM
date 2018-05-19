//
//  ViewController.swift
//  ATMmvd
//
//  Created by Carolina Rocco on 18/5/18.
//  Copyright © 2018 Silvia Rocco. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var ATMs:[ATM] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        
    }

    func loadItems(){
        let URL = "https://ucu-atm.herokuapp.com/api/atm"
        Alamofire.request(URL).responseArray { (response: DataResponse<[ATM]>) in
            self.ATMs = response.result.value!
            for atm in self.ATMs {
                self.mapView.addAnnotation(atm as! MKAnnotation)
            }
        }
    }
}

