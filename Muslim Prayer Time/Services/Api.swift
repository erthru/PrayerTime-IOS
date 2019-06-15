//
//  WheaterModel.swift
//  Muslim Prayer Time
//
//  Created by Suprianto Djamalu on 30/04/19.
//  Copyright © 2019 Erthru. All rights reserved.
//

import Foundation
import Alamofire

class Api{
    
    static let prepare = Api()
    
    func fetchAllJsonFromApi(completionHandler: @escaping (PrayerTimeResponse?,Bool) -> ()){
        
        AF.request("https://muslimsalat.com/gorontalo.json").responseJSON(completionHandler: {response in
            do{
                completionHandler(try JSONDecoder().decode(PrayerTimeResponse.self, from: response.data!), false)
            }catch let err{
                print("URLSESSIONERROR",err)
                completionHandler(nil,true)
            }
        })
        
    }
    
}
