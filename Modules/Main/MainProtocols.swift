//
//  MainMainProtocols.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 31/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
protocol MainViewProtocol where Self: UIViewController {
    var keyWordsTextField: UITextField! {get set}
}

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol! { set get }
    func configureView()
    func findTheSongButtonClicked()
}

protocol MainInteractorProtocol: class {
    func findTheSong(keyWords: String)
}

protocol MainRouterProtocol: class {
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
