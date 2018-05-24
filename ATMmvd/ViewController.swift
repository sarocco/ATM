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

class ViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    var atms:[ATM] = []

    override func viewDidLoad() {
        
        loadAtms()
        mapView.delegate = self
        super.viewDidLoad()
    }

    func loadAtms(){
        let URL = "https://ucu-atm.herokuapp.com/api/atm"
        Alamofire.request(URL).responseArray { (response: DataResponse<[ATM]>) in
            self.atms = response.result.value!
            for atm in self.atms {
                let annotation = CustomAnnotation(atm: atm, imageName: atm.network!)
                
                if (annotation.atm.network == "Banred"){
                    annotation.imageName = "greenPin"
                } else {
                   annotation.imageName = "bluePin"
                }
               self.mapView.addAnnotation(annotation)
                
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is CustomAnnotation) {
            return nil
        }
        let reuseId = "test"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
            //llamar a una func
            var button = UIButton(type: UIButtonType.detailDisclosure) as UIButton
            anView?.rightCalloutAccessoryView = button
        } else {
            anView!.annotation = annotation
        }
        let cpa = annotation as! CustomAnnotation
        anView!.image = UIImage(named:cpa.imageName)
        
        return anView
        
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToATM" {
            let vController = segue.destination as! SecondViewController
            if {
                vController. =
            } else {
                vController.
                
            }

    }*/
}

