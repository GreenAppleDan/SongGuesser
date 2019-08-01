//
//  MainMainPresenter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 31/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
class MainPresenter: MainPresenterProtocol {
    
    
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    // MARK: - MainPresenterProtocol methods
    
    func configureView() {

    }
    
    func findTheSongButtonClicked() {
        if view.keyWordsTextField.text != "" {
            interactor.findTheSong(keyWords: view.keyWordsTextField.text!)
        } else {
            AlertPresenterService.shared.presentAlert(title: "Error", message: "Text Field is empty", viewController: view)
        }
    }
}

