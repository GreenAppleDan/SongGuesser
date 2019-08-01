//
//  FoundSongsFoundSongsViewController.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 01/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class FoundSongsViewController: UIViewController, FoundSongsViewProtocol {
    
    
    var presenter: FoundSongsPresenterProtocol!
    let configurator: FoundSongsConfiguratorProtocol = FoundSongsConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
}


