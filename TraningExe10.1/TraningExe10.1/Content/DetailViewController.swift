//
//  DetailViewController.swift
//  TraningExe10.1
//
//  Created by Nguyen Huy on 10/08/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var artistString : String = ""
    var trackString : String = ""
    var thumbnailName: String = ""
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        artistName.text = artistString
        trackName.text = trackString
        thumbnailImage.image = UIImage(named: thumbnailName)
        // Do any additional setup after loading the view.
    }
    init(artistString: String, trackString: String, thumbnailName: String ) {
        self.artistString = artistString
        self.trackString = trackString
        self.thumbnailName = thumbnailName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
