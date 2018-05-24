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
    var icon: UIImage!
    var button: UIButton!

    override func viewDidLoad() {
        
        loadAtms()
        mapView.delegate = self
        super.viewDidLoad()
    }

    func loadAtms(){
        //Access to the url to get the info and save the information in the atms array
        let URL = "https://ucu-atm.herokuapp.com/api/atm"
        Alamofire.request(URL).responseArray { (response: DataResponse<[ATM]>) in
            self.atms = response.result.value!
            for atm in self.atms {
                //Set a customAnnotation depending on the atm network
                let annotation = CustomAnnotation(atm: atm, iconName: atm.network!)
                if (annotation.atm.network == "Banred"){
                    annotation.iconName = "greenPin"
                } else {
                   annotation.iconName = "bluePin"
                }
               self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    //Shows the atm information on the map when the pin is selected
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is CustomAnnotation) {
            return nil
        }
        let reuseId = "id"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
            //set a button on at the right of the annotation
            button = UIButton(type: UIButtonType.detailDisclosure) as UIButton
            anView?.rightCalloutAccessoryView = button            
            anView!.annotation = annotation
        }
        let cpa = annotation as! CustomAnnotation
        anView!.image = UIImage(named:cpa.iconName)
        return anView
        
    }
    
    //Send the information of the atm to the next view conroller when the button of the annotation is pressed
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            let an = view.annotation as! CustomAnnotation
            let vController = storyboard?.instantiateViewController(withIdentifier: "idSecondViewController") as? SecondViewController
            self.navigationController?.pushViewController(vController!, animated: true)
            vController?.atm = an.atm
        }
    }
    
    
    func setImage  (atms: [ATM]) -> UIImage{
        for atm in atms {
            if atm.network == "Banred"{
             icon = #imageLiteral(resourceName: "banred-icon")
            } else {
             icon = #imageLiteral(resourceName: "brou-icon")
            }
        }
        return icon
    }
    
}

