//
//  AuthAuthConfigurator.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 28/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class AuthConfigurator: AuthConfiguratorProtocol {
    
    func configure(with viewController: AuthViewController) {
        let presenter = AuthPresenter(view: viewController)
        let interactor = AuthInteractor(presenter: presenter)
        let router = AuthRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.logInView.delegate = presenter
    }
}
