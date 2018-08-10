

import UIKit
import Alamofire
class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listSong = [TrackModel]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("okok")
        Alamofire.request("https://itunes.apple.com/search?term=jack+johnson&entity=movie").responseJSON { (response) in
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
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSong.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        if listSong.count != 0{
            print(listSong[indexPath.row])
            print(listSong[indexPath.row].trackName)
            cell.configure(trackNameLabel: listSong[indexPath.row].trackName, artistNameLabel: listSong[indexPath.row].artistName, thumbnailName: listSong[indexPath.row].artworkUrl100)
        }
        return cell
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

