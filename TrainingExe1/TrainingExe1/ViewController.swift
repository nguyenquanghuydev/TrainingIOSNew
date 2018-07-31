//
//  ViewController.swift
//  TrainingExe1
//
//  Created by Nguyen Huy on 31/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func option1action(_ sender: Any) {
        option1()
    }
    
    @IBAction func option2action(_ sender: Any) {
        option2()
    }
    
    @IBAction func option3action(_ sender: Any) {
        option3()
    }
    
    @IBAction func option4Action(_ sender: Any) {
        option4()
    }
    @IBAction func option5action(_ sender: Any) {
        option5()
    }
    
    func option1()
    {
        var str = "Hello World"
        print(str)
    }
    func option2()
    {
        print("************")
        for i in 0...10 {
            print("*          *")
        }
        print("************")
    }
    func option3()
    {
        var arr = ["hom","nay","la","mot","ngay","dep","troi"]
        print("Mang truoc: ")
        for str in arr {
            print(str)
        }
        
        print("Nhap vao phan tu can them la: ")
        let input = "okok "
        
        arr.append(input)
        print("Mang sau khi them: /n")
        for str in arr {
            print(str)
        
        }
    }
    
    func option4()  {
         var person = Dictionary<String, String>()
        person["name"] = "Huy"
        person["age"] = "18"
        person["add"] = "Ha Noi"
        person["phone"] = "0123231232"
    
    
        print(person["name"] ?? "error")
    }
    func option5()
    {
        var persions  : [[String: String]] = []
        persions.append(["name": "A", "age": "19", "add": "bac giang","phone":"1234567890"])
        persions.append(["name": "B", "age": "17", "add": "bac giang","phone":"1234567890"])
        persions.append(["name": "C", "age": "20", "add": "bac giang","phone":"1234567890"])
        persions.append(["name": "D", "age": "29", "add": "bac giang","phone":"1234567890"])
        for obj in persions
        {
            print(obj["name"] ?? "")
        }
        let new = persions.sorted {$0["age"]! < $1["age"]!}
        print("Sau khi sap xep")
        for obj in new
        {
            print(obj["name"] ?? "")
        }
    //    emptyDict["]
        
    }
   
}

