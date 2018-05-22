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
    
    var atms:[ATM] = []
    var annotation = MKPointAnnotation()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAtms()
    }

    func loadAtms(){
        let URL = "https://ucu-atm.herokuapp.com/api/atm"
        Alamofire.request(URL).responseArray { (response: DataResponse<[ATM]>) in
            self.atms = response.result.value!
            for atm in self.atms {
                self.annotation.coordinate = atm.location
                /*self.annotation.coordinate = CLLocationCoordinate2D(latitude: (atm.location.latitude)!, longitude: (atm.location.longitud)!)*/
                self.annotation.title = atm.address
                self.mapView.addAnnotation(self.annotation)
            }
        }
    }
}

