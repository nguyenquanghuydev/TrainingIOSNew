//
//  Model.swift
//  TraningExe10.1
//
//  Created by Nguyen Huy on 09/08/2018.
//  Copyright © 2018 Nguyen Huy. All rights reserved.
//

import Foundation
struct TrackModel: Codable
{
    var trackId : Int
    var artistName: String
    var trackName: String
    let artworkUrl100 : String
   
    
}
struct AudioBookModel: Codable
{
    var trackId : Int
    var artistName: String
     var collectionName : String
    let artworkUrl100 : String
    
    
}

struct Results: Codable{
    var resultCount: Int
    var results = [TrackModel]()
}
struct AudioBookResult: Codable{
    var resultCount: Int
    var results = [AudioBookModel]()
}

class SongModel {
    
}
