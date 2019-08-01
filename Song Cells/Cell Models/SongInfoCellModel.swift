//
//  SongInfoCell.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 01/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit

class SongInfoCellModel: SongBaseCellModel{
    override var cellIdentifier : String {
        return "SongInfoCell"
    }
    var title:String
    var image: UIImage?
    
    init(song: Song){
        title = song.fullTitle
    }
}
//class AnalyticsInfoCellModel: AnalyticsBaseCellModel {
//    override var cellIdentifier: String {
//        return "AnalyticsInfoCell"
//    }
//
//    var productName: String
//    var probabilityScore: Float
//    var isCheckerVisible: Bool = false
//
//    init(concept: ClarifaiConcept) {
//        productName = concept.name
//        probabilityScore = concept.score
//    }
//}
