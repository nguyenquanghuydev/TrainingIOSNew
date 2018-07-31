//
//  detailViewController.swift
//  TrainingExe4
//
//  Created by Nguyen Huy on 10/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var captureValue: UILabel!
    @IBOutlet weak var avValue: UILabel!
    @IBOutlet weak var loviValue: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    var imageName : String = ""
    var avValues: String = ""
    var captureValues: String = ""
    var loviValues: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avValue.text = avValues
        captureValue.text = captureValues
        loviValue.text = loviValues
        image.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
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
