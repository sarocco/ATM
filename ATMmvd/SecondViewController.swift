//
//  SecondViewController.swift
//  ATMmvd
//
//  Created by Carolina Rocco on 18/5/18.
//  Copyright © 2018 Silvia Rocco. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var atmImage: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var openingHoursLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var depositLbl: UILabel!
    @IBOutlet weak var networkImage: UIImageView!
    
    var atm: ATM!
    
    override func viewDidLoad() {
        
        if let atm = atm {
            //atmImage.image = UIImage(named: atm.image!)
            statusLbl.text = atm.status
            address.text = atm.address
            openingHoursLbl.text = atm.open_hours
            networkImage.image = UIImage(named: atm.network!)
            if atm.has_money!{
                moneyLbl.text = "Has Money"
            } else {
                moneyLbl.text = "No Money"
            }
            if atm.accepts_deposits!{
                depositLbl.text = "Deposits"
            } else {
                depositLbl.text = "No Deposits"
            }
            

        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
