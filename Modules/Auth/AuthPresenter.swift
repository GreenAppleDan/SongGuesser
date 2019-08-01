//
//  AuthAuthPresenter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 28/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import PromiseKit
class AuthPresenter: AuthPresenterProtocol , LogInViewDelegate {
    
    weak var view: AuthViewProtocol!
    var interactor: AuthInteractorProtocol!
    var router: AuthRouterProtocol!
    
    required init(view: AuthViewProtocol) {
        self.view = view
    }
    
    // MARK: - AuthPresenterProtocol methods
    
    func configureView() {

    }
    
    //AuthPresenterProtocol Methods
    
    func loginButtonClicked() {
        view.showLogInView()
    }
    
    func registerButtonClicked(email: String , password:String) {
        if EmailValidatorService.shared.isValidEmailAddress(emailAddressString: email) , password != "" {
            
            firstly {FirebaseAuthService.shared.registerNewUser(email: email, password: password)}.done { (boolResult) in
                if boolResult {
                    print("registration Success!")
                    self.router.moveToTabBar()
                } else {
                    self.presentAlert(title: "Registration error", message: "Ensure your values are correct and try again")
                }
            }
            
        } else {
            presentAlert(title: "Wrong info", message: "Please verify that email is correct and password is set")
        }
    }
    
    
    // LogInViewDelegate Methods
    func logInButtonClickedSubView(email: String, password: String) {
        firstly {FirebaseAuthService.shared.logInUser(email: email, password: password)}.done { (boolResult) in
            if boolResult {
                print("login Success!")
                self.router.moveToTabBar()
            } else {
                self.presentAlert(title: "Login Error", message: "Ensure your values are correct and try again")
            }
        }
    }
    
    func registerButtonClickedSubView() {
        view.hideLogInView()
    }
    
    func presentAlert(title: String, message: String) {
        AlertPresenterService.shared.presentAlert(title: title, message: message, viewController: view)
    }
}

