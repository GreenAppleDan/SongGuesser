//
//  MainMainViewController.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 31/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    
    @IBOutlet weak var keyWordsTextField: UITextField!
    
    
    @IBAction func findTheSongButtonClicked(_ sender: UIButton) {
        presenter.findTheSongButtonClicked()
    }
    
    var presenter: MainPresenterProtocol!
    let configurator: MainConfiguratorProtocol = MainConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
}


