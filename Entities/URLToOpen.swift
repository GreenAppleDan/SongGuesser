//
//  URLToOpen.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 02/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation

class URLToOpen {
    var url: String
    var urlType: URLType
    
    init(url: String , urlType: URLType){
        self.url = url
        self.urlType = urlType
    }
}
