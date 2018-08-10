//
//  ContentTableViewCell.swift
//  TraningExe10.1
//
//  Created by Nguyen Huy on 08/08/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit
import Kingfisher
class ContentTableViewCell: UITableViewCell {
    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(trackNameLabel: String, artistNameLabel: String, thumbnailName : String) {
        print(trackNameLabel)
        self.trackNameLabel.text = trackNameLabel
        self.artistNameLabel.text = artistNameLabel
        print(thumbnailName)
        let url = URL(string: thumbnailName)
        self.thumbnailImage.kf.setImage(with: url)
    }
}
