//
//  MyFoundSongsMyFoundSongsConfigurator.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class MyFoundSongsConfigurator: MyFoundSongsConfiguratorProtocol {
    
    func configure(with viewController: MyFoundSongsViewController) {
        let presenter = MyFoundSongsPresenter(view: viewController)
        let interactor = MyFoundSongsInteractor(presenter: presenter)
        let router = MyFoundSongsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.lyricsView.delegate = presenter
    }
}
