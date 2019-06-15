//
//  Item.swift
//  Muslim Prayer Time
//
//  Created by Suprianto Djamalu on 16/06/19.
//  Copyright © 2019 Erthru. All rights reserved.
//

import Foundation

struct Item: Decodable{
    var dateFor:String
    var fajr:String
    var shurooq:String
    var dhuhr:String
    var asr:String
    var maghrib:String
    var isha:String
    
    private enum CodingKeys: String, CodingKey{
        case dateFor = "date_for"
        case fajr
        case shurooq
        case dhuhr
        case asr
        case maghrib
        case isha
    }
}
