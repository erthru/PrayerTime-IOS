//
//  ViewController.swift
//  Muslim Prayer Time
//
//  Created by Suprianto Djamalu on 30/04/19.
//  Copyright © 2019 Erthru. All rights reserved.
//

import UIKit
import CoreLocation

class PrayerController: UIViewController {

    @IBOutlet weak var loading:UIActivityIndicatorView!
    @IBOutlet weak var lbCity:UILabel!
    @IBOutlet weak var lbDate:UILabel!
    @IBOutlet weak var lbFajr:UILabel!
    @IBOutlet weak var lbShuuroq:UILabel!
    @IBOutlet weak var lbDhuhr:UILabel!
    @IBOutlet weak var lbAsr:UILabel!
    @IBOutlet weak var lbMagrib:UILabel!
    @IBOutlet weak var lbIsha:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPrayerTime()
    }
    
    func showPrayerTime(){
        
        loading.isHidden = false
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        Api.prepare.fetchAllJsonFromApi(completionHandler: {response,error in
            if !error{
                self.loading.isHidden = true
                self.lbCity.text = response?.city
                self.lbDate.text = formatter.string(from: Date())
                self.lbShuuroq.text = "SHUROOQ: \(response?.items[0].shurooq ?? "")"
                self.lbFajr.text = "FAJR: \(response?.items[0].fajr ?? "")"
                self.lbDhuhr.text = "DHUHR: \(response?.items[0].dhuhr ?? "")"
                self.lbAsr.text = "ASR: \(response?.items[0].asr ?? "")"
                self.lbMagrib.text = "MAGHRIB: \(response?.items[0].maghrib ?? "")"
                self.lbIsha.text = "ISHA: \(response?.items[0].isha ?? "")"
            }else{
                self.loading.isHidden = true
                
                let alert = UIAlertController(title: "ERROR", message: "Connection Failed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        })
        
    }

}

