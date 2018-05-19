//
//  ViewController.swift
//  ATMmvd
//
//  Created by Carolina Rocco on 18/5/18.
//  Copyright © 2018 Silvia Rocco. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var ATMs:[ATM] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    func loadItems(){
        let URL = "https://ucu-atm.herokuapp.com/api/atm"
        Alamofire.request(URL).responseString { (response: DataResponse<[ATM]>) in
            self.ATMs = response.result.value!;
        }

    }
}

