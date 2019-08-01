//
//  Song.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 31/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import UIKit
class Song {
    var name: String
    var author: String
    var lyrics: String
    var fullTitle: String
    var image: UIImage?
    var utubeLink: String?
    var appleMusicLink: String?
    var spotifyLink: String?
    
    init(name: String , author: String , fullTitle: String, lyrics: String) {
        self.name = name
        self.author = author
        self.lyrics = lyrics
        self.fullTitle = fullTitle
    }
}
