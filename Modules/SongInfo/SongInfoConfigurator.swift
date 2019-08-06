//
//  SongInfoSongInfoConfigurator.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 02/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class SongInfoConfigurator: SongInfoConfiguratorProtocol {
    
    func configure(with viewController: SongInfoViewController) {
        let presenter = SongInfoPresenter(view: viewController)
        let interactor = SongInfoInteractor(presenter: presenter)
        let router = SongInfoRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.lyricsView.delegate = presenter
    }
}
