//
//  PrayerTime.swift
//  Muslim Prayer Time
//
//  Created by Suprianto Djamalu on 15/06/19.
//  Copyright © 2019 Erthru. All rights reserved.
//

import Foundation

struct PrayerTimeResponse: Decodable {
    var title:String
    var query:String
    var prayerMethodName:String
    var timeZone:String
    var address:String
    var city:String
    var items:[Item]
    
    private enum CodingKeys:String, CodingKey{
        case title
        case query
        case prayerMethodName = "prayer_method_name"
        case timeZone = "timezone"
        case address
        case city
        case items
    }
    
}
