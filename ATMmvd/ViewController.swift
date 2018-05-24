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

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAtms()
    }

    func loadAtms(){
        let URL = "https://ucu-atm.herokuapp.com/api/atm"
        Alamofire.request(URL).responseArray { (response: DataResponse<[ATM]>) in
            self.atms = response.result.value!
            for atm in self.atms {
                
                let annotation = CustomAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: (atm.location?.latitude)!, longitude: (atm.location?.longitud)!)
                annotation.title = atm.address
                annotation.imageName = "pointer.png"
                self.mapView.addAnnotation(annotation)
                
                /*var annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: (atm.location?.latitude)!, longitude: (atm.location?.longitud)!)
                annotation.title = atm.address
                self.mapView.addAnnotation(annotation)*/
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

