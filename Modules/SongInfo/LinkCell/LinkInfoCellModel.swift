//
//  LinkInfoCellModel.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 02/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation

class LinkInfoCellModel: LinkBaseCellModel{
    override var cellIdentifier : String {
        return "LinkInfoCell"
    }
    var url:String
    var urlType: URLType
    
    init(url: String , urlType: URLType){
       self.url = url
        self.urlType = urlType
    }
}
