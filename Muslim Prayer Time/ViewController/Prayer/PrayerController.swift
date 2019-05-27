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
        
        PrayerTimeModel.prepare.fetchAllJsonFromApi(completionHandler: {json,error in
            if error{
                
                self.loading.isHidden = true
                
                let alert = UIAlertController(title: "ERROR", message: "Connection Failed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                self.present(alert, animated: true)
            }else{
                
                self.loading.isHidden = true
                
                let city = json["city"].string!
                let fajr = json["items"][0]["fajr"].string!
                let shurooq = json["items"][0]["shurooq"].string!
                let dhuhr = json["items"][0]["dhuhr"].string!
                let asr = json["items"][0]["asr"].string!
                let maghrib = json["items"][0]["maghrib"].string!
                let isha = json["items"][0]["isha"].string!
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-yyyy"
                
                self.lbCity.text = city
                self.lbDate.text = formatter.string(from: Date())
                self.lbFajr.text = "Fajr: \(fajr)"
                self.lbShuuroq.text = "Shuuroq: \(shurooq)"
                self.lbDhuhr.text = "Dhuhr: \(dhuhr)"
                self.lbAsr.text = "Asr: \(asr)"
                self.lbMagrib.text = "Maghrib: \(maghrib)"
                self.lbIsha.text = "Isha: \(isha)"
                
            }
        })
    }

}

