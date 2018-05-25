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
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var atm: ATM!
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        
        if let atm = atm {
            statusLbl.text = atm.status
            statusLbl.layer.cornerRadius = 20
            address.text = atm.address
            openingHoursLbl.text = atm.open_hours
            networkImage.image = UIImage(named: atm.network!)
            let url = URL(string: atm.image!)
            atmImage.contentMode = .scaleAspectFill
            atmImage.clipsToBounds = true

            downloadImage(url: url!)
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
            grayView.layer.cornerRadius = 20

        }
        super.viewDidLoad()

    }

    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        spiner.startAnimating()
        getDataFromUrl(url: url) { data, response, error in
            DispatchQueue.main.async() {
                self.spiner.stopAnimating()
            }
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.atmImage.image = UIImage(data: data)
                self.spiner.stopAnimating()
            }
        }
    }

}
