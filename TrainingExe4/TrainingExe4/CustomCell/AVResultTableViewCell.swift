//
//  AVResultTableViewCell.swift
//  TrainingExe4
//
//  Created by Nguyen Huy on 09/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit

class AVResultTableViewCell: UITableViewCell {

    @IBOutlet weak var captureDate: UILabel!
    @IBOutlet weak var avValue: UILabel!
    @IBOutlet weak var loviValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadView(avResult : AVResult)
    {
        captureDate.text = convertNSDate(date: avResult.captureDate)
        avValue.text = String(avResult.avValue)
        loviValue.text = String(avResult.loviValue)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func convertNSDate(date : NSDate) -> String
    {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let stringDate = String(dateFormatter.string(from: date as Date))
        return stringDate
    }
}
