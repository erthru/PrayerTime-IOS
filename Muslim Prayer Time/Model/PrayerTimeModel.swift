//
//  WheaterModel.swift
//  Muslim Prayer Time
//
//  Created by Suprianto Djamalu on 30/04/19.
//  Copyright © 2019 Erthru. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PrayerTimeModel{
    
    static let prepare = PrayerTimeModel()
    
    func fetchAllJsonFromApi(completionHandler: @escaping (JSON,Bool) -> ()){
        
        AF.request("https://muslimsalat.com/gorontalo.json").responseJSON{ response in
            
            switch response.result{
                
                case .success(let value):
                    completionHandler(JSON(value),false)
                    break
                
                case .failure(let error):
                    print("ONERROR: \(error)")
                    completionHandler(JSON(""),true)
                    break
            }
            
        }
        
    }
    
}
