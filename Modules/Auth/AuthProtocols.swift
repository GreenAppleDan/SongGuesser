//
//  AuthAuthProtocols.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 28/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
protocol AuthViewProtocol where Self: UIViewController {
    var logInView: LogInView! {get set}
    func showLogInView()
    func hideLogInView()
}

protocol AuthPresenterProtocol: class {
    var router: AuthRouterProtocol! { set get }
    func configureView()
    func loginButtonClicked()
    func registerButtonClicked(email: String , password:String)
}

protocol AuthInteractorProtocol: class {
}

protocol AuthRouterProtocol: class {
}

protocol AuthConfiguratorProtocol: class {
    func configure(with viewController: AuthViewController)
}
