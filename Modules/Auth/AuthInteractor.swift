//
//  AuthAuthInteractor.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 28/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class AuthInteractor: AuthInteractorProtocol {
    
    weak var presenter: AuthPresenterProtocol!
    
    required init(presenter: AuthPresenterProtocol) {
        self.presenter = presenter
    }   
}

