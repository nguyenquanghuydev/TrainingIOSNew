//
//  ContentTableViewController.swift
//  TraningExe10.1
//
//  Created by Nguyen Huy on 08/08/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit
import Alamofire
class ContentTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
 
    var listSong = [TrackModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        print("okok")
        Alamofire.request("https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo").responseJSON { (response) in
                switch response.result
                {
                case .success(let value):
                    print(value)
                    guard let datas = response.data else { return }
                    let decoder = JSONDecoder()
                    do{
                        let obj =  try? decoder.decode(Results.self, from: datas)
                        
                        for obj in (obj?.results)!
                        {
                            print(obj)
                            self.listSong.append(obj)
                            
                        }
                        //    print(obj?.results[1])
                        self.tableview.reloadData()
                    }
                        //
                    catch let error
                    {
                        print(error)
                    }
                    //
                //  let jsonData = JSON(data: data)
                case .failure(let err): print(err)
                }
            }
    }
    override func viewWillAppear(_ animated: Bool) {
        print("will")
        
    }
    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSong.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! ContentTableViewCell
        print(listSong[indexPath.row].trackName)
        cell.configure(trackNameLabel: listSong[indexPath.row].trackName, artistNameLabel: listSong[indexPath.row].artistName, thumbnailName: listSong[indexPath.row].artworkUrl100)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
    }
}
