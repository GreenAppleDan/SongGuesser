//
//  AudDService.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 31/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON
import PromiseKit
class AudDService {
    static let shared = AudDService()
    
    private init()  {}
    
    func getArrayOfSongsFromRequest(keyWords: String) -> Promise<[Song]> {
        
        
        return Promise { seal in
        
        Alamofire.request("https://api.audd.io/findLyrics/?q=" + keyWords).validate().responseJSON { (response) in
            var arrayOfSongs = [Song]()
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                seal.fulfill([Song]())
            case .success(let value):
                let json = JSON(value)
                if json["status"] == "success"{
                    print(json["result"].arrayValue)
                    var currentIndex = 0
                    for songJson in json["result"].arrayValue {
                        
                        var name: String
                        var author: String
                        var lyrics: String
                        var fullTitle: String
                        var utubeLink: String?
                        var appleMusicLink: String?
                        var spotifyLink: String?
                        
                        name = songJson["titile"].stringValue
                        author = songJson["artist"].stringValue
                        lyrics = songJson["lyrics"].stringValue
                        fullTitle = songJson["full_title"].stringValue
                        
                        var songToAddToArray = Song(name: name, author: author, fullTitle: fullTitle, lyrics: lyrics)
                        // getting URLs
                        var jsonString = json["result"][currentIndex]["media"].stringValue
                        currentIndex += 1
                        print(jsonString)
                        if jsonString != "[]" {
                        let data = jsonString.data(using: .utf8)!
                        do {
                            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [[String: Any]] {
                                
                                for myDic in jsonArray{
                                    
                                    print(myDic)
                                    switch myDic["provider"] as! String{
                                    case URLType.appleMusic.rawValue:
                                        appleMusicLink = myDic["url"] as! String
                                        songToAddToArray.appleMusicLink = appleMusicLink
                                    case URLType.youTube.rawValue:
                                        utubeLink = myDic["url"] as! String
                                        songToAddToArray.utubeLink = utubeLink
                                    case URLType.spotify.rawValue:
                                        spotifyLink = myDic["url"] as! String
                                        songToAddToArray.spotifyLink = spotifyLink
                                    default:
                                        print("no idea what happened")
                                    }
                                }
                            }
                        } catch let error as NSError {
                            print(error)
                        }
                        } else {print("wtf")}
                        arrayOfSongs.append(songToAddToArray)
                    }
                    seal.fulfill(arrayOfSongs)
                
                } else {
                    //RETURN EMPTY ARRAY AND ALARM USER
                    print(json)
                    seal.fulfill([Song]())
                }
                
            }
}
    }
}
}
