//
//  AVResult.swift
//  TrainingExe4
//
//  Created by Nguyen Huy on 09/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import Foundation
class AVResult
{
    var imageName = "aa"
    var captureDate : NSDate
    var avValue : Float
    var loviValue : Int
    
    init(capturDate: NSDate, avValue : Float, loviValue: Int) {
        self.captureDate = capturDate
        self.avValue = avValue
        self.loviValue = loviValue
    }
    
    func convertNSDate(date : NSDate) -> String
    {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let stringDate = String(dateFormatter.string(from: date as Date))
        return stringDate
    }
    
    func getNSDate() -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let stringDate = String(dateFormatter.string(from: captureDate as Date))
        return stringDate
    }
}
