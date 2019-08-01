//
//  MainMainInteractor.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 31/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import PromiseKit
class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func findTheSong(keyWords: String) {
        
        var preparedStringForUrl = keyWords.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: "'", with: "%27")
        
        firstly{AudDService.shared.getArrayOfSongsFromRequest(keyWords: preparedStringForUrl)}.done { arrayOfSongs in
            print(arrayOfSongs)
        }
    }
}

