//
//  AddAVResultViewController.swift
//  TrainingExe4
//
//  Created by Nguyen Huy on 11/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit
import CoreData
class AddAVResultViewController: UIViewController {
    var newAVResult = NSManagedObject()
    var context = NSManagedObjectContext()
    @IBOutlet weak var btn_Add: UIButton!
    @IBOutlet weak var tf_loviValue: UITextField!
    @IBOutlet weak var tf_avValue: UITextField!
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "AVModel", in: context)
        newAVResult = NSManagedObject(entity: entity!, insertInto: context)
    
        // Do any additional setup after loading the view.
    }
    func getCurrentDate() -> NSDate {
        let currentDate = NSDate()
        return currentDate
    }
    func showAlert(message: String )
    {
      //  let alert = UIAlertView.init(title: "Thong Bao", message: message, delegate: self, cancelButtonTitle: "OK")
        let alert = UIAlertController.init(title: "Thong Bao", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                self.self.dismiss(animated: true, completion: nil)
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
          //  self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddAction(_ sender: Any) {
       
        let captureValue = getCurrentDate()
        let avValue = Float(tf_avValue.text!)
        let loveValue = Int(tf_loviValue.text!)
        
        newAVResult.setValue(captureValue, forKey: "captureValue")
        newAVResult.setValue(avValue, forKey: "avValue")
        newAVResult.setValue(loveValue, forKey: "loviValue")
        
        do {
            try context.save()
            showAlert(message: "Thêm thành công")
        } catch {
            
            print("Failed saving")
        }
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
