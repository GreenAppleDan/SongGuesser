//
//  AuthAuthViewController.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 28/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class AuthViewController: UIViewController, AuthViewProtocol {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInView: LogInView!
    
    @IBOutlet weak var offsetLogInView: NSLayoutConstraint!
    
    @IBAction func registerUserButtonClicked(_ sender: UIButton) {
        presenter.registerButtonClicked(email: emailTextField.text! , password : passwordTextField.text!)
    }
    
    @IBAction func logInButtonClicked(_ sender: UIButton) {
        presenter.loginButtonClicked()
    }
    
    
    var presenter: AuthPresenterProtocol!
    let configurator: AuthConfiguratorProtocol = AuthConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    func showLogInView() {
        UIView.animate(withDuration: 0.5) {
            self.offsetLogInView.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func hideLogInView() {
        UIView.animate(withDuration: 0.5) {
            self.offsetLogInView.constant = -self.logInView.frame.size.height
            self.view.layoutIfNeeded()
        }
    }
    
}


