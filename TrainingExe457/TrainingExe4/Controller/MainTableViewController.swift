//
//  MainTableViewController.swift
//  TrainingExe4
//
//  Created by Nguyen Huy on 09/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit
import CoreData
class MainTableViewController: UITableViewController {
    var items = [AVResult]()
    var isEditMode : Bool = false
    var context = NSManagedObjectContext()
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var moveButton: UIBarButtonItem!
    
    override func viewDidAppear(_ animated: Bool) {
         self.loadData()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.loadData()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = NSDate()
       // deleteAllData(entity: "AVMode")
       // self.DeleteAllData()
      //  initDataCore()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
         context = appDelegate.persistentContainer.viewContext
        
       
    
       

    
    //    self.navigationItem.rightBarButtonItem = sel
//        items.append(AVResult(capturDate: currentDate, avValue: 23, loviValue: 12))
//        items.append(AVResult(capturDate: currentDate, avValue: 23, loviValue: 13))
//        items.append(AVResult(capturDate: currentDate, avValue: 23, loviValue: 14))
//        items.append(AVResult(capturDate: currentDate, avValue: 23, loviValue: 15))
//        items.append(AVResult(capturDate: currentDate, avValue: 23, loviValue: 16))
//        items.append(AVResult(capturDate: currentDate, avValue: 23, loviValue: 17))
    }

  
    
   
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
      
        // self.view.addSubview(tableNibView)

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData()
    {
        items.removeAll()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AVModel")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if ( data != nil)
                {
                    print(data)
                let captureValue = data.value(forKey: "captureValue") as! NSDate
                let avValue = data.value(forKey: "avValue") as! Float
                let loviValue = data.value(forKey: "loviValue") as! Int
                print(captureValue)
                print(avValue)
                print(loviValue)
                let obj = AVResult(capturDate: captureValue, avValue: avValue, loviValue: loviValue)
                items.append(obj)
                self.tableView.reloadData()
                }
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
//    func deleteUserInfoData() {
//        let appDelegate =
//            UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.mana!
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AVModel")
//        fetchRequest.includesPropertyValues = false // Only fetch the managedObjectID (not the full object structure)
//        if let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [UserInfo] {
//            for result in fetchResults {
//                managedContext.deleteObject(result)
//            }
//        }
//        var err: NSError?
//        if !managedContext.save(&err) {
//            println("User Info deleteData - Error : \(err!.localizedDescription)")
//            abort()
//        } else {
//            println("User Info deleteData - Success")
//        }
//    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "avResultCell", for: indexPath) as! AVResultTableViewCell
        cell.loadView(avResult: items[indexPath.row])
        print(cell.avValue)
        // Configure the cell...

        return cell
    }
 

    
   //  Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        print(indexPath.row)
        return true
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetailVC" {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let obj = items[indexPath.row]
                if (indexPath.row % 2 == 0 )
                {
                    let detailVC = segue.destination as! detailViewController
                    
                    detailVC.avValues = String(obj.avValue)
                    detailVC.captureValues = String(obj.getNSDate())
                    detailVC.loviValues = String(obj.loviValue)
                    detailVC.imageName = obj.imageName
                }
                else
                {
                    nextViewByPresent(obj: obj)
                }
            }
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.
//    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = items[indexPath.row]
      //  passData(obj: obj)
       // print(obj.captureDate)
        nextViewByNavi(obj: obj)
    }
    
    @IBAction func moveButtonAction(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
      //  super.
        if tableView.isEditing
        {
            self.moveButton.title = "Done"
        }
        else
        {
            self.moveButton.title = "Move"
        }
        
    }
    
    func nextViewByNavi(obj: AVResult)  {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! detailViewController
        
        detailVC.avValues = String(obj.avValue)
        detailVC.captureValues = String(obj.getNSDate())
        detailVC.loviValues = String(obj.loviValue)
        detailVC.imageName = obj.imageName; self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func nextViewByPresent(obj: AVResult)
    {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! detailViewController
        detailVC.avValues = String(obj.avValue)
        detailVC.captureValues = String(obj.getNSDate())
        detailVC.loviValues = String(obj.loviValue)
        detailVC.imageName = obj.imageName
        
        self.present(detailVC, animated: true, completion: nil)
    }   
    
    @IBAction func EditBottonAction(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        //self.tableView.setEditing(editing, animated: animated)
        if tableView.isEditing
        {
            self.editButton.title = "Done"
           
        }
        else
        {
            self.editButton.title = "Edit"
        }
    }
    
    
//    func passData(obj: AVResult)
//    {
//        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! detailViewController
//        print(obj.loviValue)
//        let s = String(obj.loviValue)
//        detailVC.loviValue.text = "sadsa"
//       // detailVC.captureValue.text = obj.convertNSDate(date: obj.captureDate)
//       // detailVC.avValue.text = obj.avValue as! String
//        navigationController?.pushViewController(detailVC, animated: true)
//    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        let movedObject = self.items[fromIndexPath.row]
//        items.remove(at: fromIndexPath.row)
//        items.insert(movedObject, at: destinationIndexPath.row)
    }
 

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
 
 
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
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

extension UIViewController
{
    func initDataCore() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
    }
}
