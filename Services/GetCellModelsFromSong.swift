//
//  GetCellModelsFromSong.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 06/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
class GetCellModelsFromSong {
    static let shared = GetCellModelsFromSong()
    
    private init() {}
    
    func getCellModelsFromSong(song: Song) -> [LinkInfoCellModel] {
        
        var arrayOfModels = [LinkInfoCellModel]()
        if let youtubeUrl = song.utubeLink{
            arrayOfModels.append(LinkInfoCellModel(url: youtubeUrl, urlType: .youTube))
        }
        if let spotifyUrl = song.spotifyLink{
            arrayOfModels.append(LinkInfoCellModel(url: spotifyUrl, urlType: .spotify))
        }
        if let appleMusicUrl = song.appleMusicLink{
            arrayOfModels.append(LinkInfoCellModel(url: appleMusicUrl, urlType: .appleMusic))
        }
        return arrayOfModels
        
    }
}
