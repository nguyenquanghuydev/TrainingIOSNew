//
//  ViewController.swift
//  TrainingExe2
//
//  Created by Nguyen Huy on 03/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_phone3: UITextField!
    @IBOutlet weak var tf_phone2: UITextField!
    @IBOutlet weak var tf_phone1: UITextField!
    @IBOutlet weak var rbt_womem: UIButton!
    @IBOutlet weak var rbt_men: UIButton!
    @IBOutlet weak var tf_date: UITextField!
    @IBOutlet weak var tf_namekana2: UITextField!
    @IBOutlet weak var tf_namekana1: UITextField!
    @IBOutlet weak var tf_name2: UITextField!
    @IBOutlet weak var tf_name1: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tf_date.placeholder = "19/05/1995"
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initView()
    {
        rbt_men.setImage(UIImage(named: "unchecked.png"), for: .normal)
        rbt_womem.setImage(UIImage(named: "unchecked.png"), for: .normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        if (tf_name1.text != "" && tf_name2.text != "" && tf_namekana1.text != "" && tf_namekana2.text != "" && tf_email.text != "" && tf_date.text != "" && tf_phone1.text != "" && tf_phone2.text != "" && tf_phone3.text != "")
        {
            if checkEmailFormat(email: tf_email.text!)
            {
                showAleart(str: "Đăng ký thành công")
            }
            else {
                showAleart(str: "Email sai định dạng")
            }
            
        }
        else {
            showAleart(str: "Chưa điền đầy đủ thông tin")
        }
        
        
    }
    
    func showAleart(str : String)  {
        var all = UIAlertView(title: "Thông báo", message: str, delegate: self, cancelButtonTitle: "Okey")
        all.show()
    }
 
    func checkEmailFormat(email : String) -> Bool {
        guard email != nil else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
}

