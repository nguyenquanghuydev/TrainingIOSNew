//
//  MusicPlayerTableViewCell.swift
//  TrainingExe89
//
//  Created by Nguyen Huy on 12/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit
import Kingfisher
class MusicPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var img_avatarCell: UIImageView!
    @IBOutlet weak var lb_trackTime: UILabel!
    @IBOutlet weak var lb_trackPrice: UILabel!
    @IBOutlet weak var lb_trackName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func loadView(obj: TrackModel)
    {
        lb_trackName.text = obj.trackName
        lb_trackTime.text = String(obj.trackTimeMillis)
        lb_trackPrice.text = String(obj.trackPrice)
        let url = URL(string: obj.artworkUrl100)
        img_avatarCell.kf.setImage(with: url)
    }
}
