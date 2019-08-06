//
//  MyFoundSongsMyFoundSongsInteractor.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class MyFoundSongsInteractor: MyFoundSongsInteractorProtocol {
    
    weak var presenter: MyFoundSongsPresenterProtocol!
    
    required init(presenter: MyFoundSongsPresenterProtocol) {
        self.presenter = presenter
    }   
}

