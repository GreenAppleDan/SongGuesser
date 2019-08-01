//
//  FoundSongsFoundSongsProtocols.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol FoundSongsViewProtocol: class {
}

protocol FoundSongsPresenterProtocol: class {
    var router: FoundSongsRouterProtocol! { set get }
    func configureView()
}

protocol FoundSongsInteractorProtocol: class {
}

protocol FoundSongsRouterProtocol: class {
}

protocol FoundSongsConfiguratorProtocol: class {
    func configure(with viewController: FoundSongsViewController)
}
