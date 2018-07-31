//
//  ViewController.swift
//  TrainingExe89
//
//  Created by Nguyen Huy on 12/07/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation
import iTunesSearchAPI
import SwiftyJSON
import Alamofire
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView : UITableView?
        let myTableView: UITableView = UITableView( frame: CGRect.zero, style: .grouped )
        let itunes = iTunes.init(session: URLSession.shared, debug: false)
        var albums: [AlbumInfo] = []
        var songQuery: SongQuery = SongQuery()
        var audio: AVAudioPlayer?
        var count : Int = 0
    var listSong = [TrackModel]()
        override func viewDidLoad() {
            
            super.viewDidLoad()
            listSong.removeAll()
           // makeGetCall()
            Alamofire.request("https://itunes.apple.com/search?term=jack+johnson&limit=25").responseJSON { (response) in
               
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
                                print(obj.trackName)
                                self.listSong.append(obj)
                                
                            }
                        //    print(obj?.results[1])
                            self.tableView?.reloadData()
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
 
       
//            itunes.search(for: "son tung") { result in
//                // handle the Result<Any, SearchError>
//                print(result.value!)
//                let value = result.value! as! [String:AnyObject]
//                var countResult = value["resultCount"] as! Int
//
//                var results = value["results"] as! [AnyObject]
//                print()
//                let i = 0
//                while (i < countResult)
//                {
//                    print(results[i])
//                    let a = results[i] as! NSDictionary
//                    let song = SongModel.parseJSON(data: a)
//                    print(song)
//                    self.listSong.append(song)
//                }
//                }
    
  
        func displayMediaLibraryError() {

            var error: String
            switch MPMediaLibrary.authorizationStatus() {
            case .restricted:
                error = "Media library access restricted by corporate or parental settings"
            case .denied:
                error = "Media library access denied by user"
            default:
                error = "Unknown error"
            }

            let controller = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            controller.addAction(UIAlertAction(title: "Open Settings", style: .default, handler: { (action) in
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
            }))
            present(controller, animated: true, completion: nil)
        }

        override func didReceiveMemoryWarning() {

            super.didReceiveMemoryWarning()

        }
//
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
           // return albums.count
        }

        func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int  {
            return listSong.count
         //   return albums[section].songs.count
        }

        func tableView( _ tableView: UITableView, cellForRowAt indexPath:IndexPath ) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(
                withIdentifier: "MusicPlayerCell",
                for: indexPath) as! MusicPlayerTableViewCell
            let obj = listSong[indexPath.row]
            cell.loadView(obj: obj)
            return cell;
        }

//
//        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//            return albums[section].albumTitle
//        }
    
}


