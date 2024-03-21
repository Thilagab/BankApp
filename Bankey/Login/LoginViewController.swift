//
//  ViewController.swift
//  Bankey
//
//  Created by Thilagawathy Duraisamy on 20/3/2024.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()

    let signInButton = UIButton(type: .system)
    var errorSignInMsg = UILabel()

    var userName: String? {
        return loginView.userNameTextField.text
    }
    
    var passwd: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            print("View Controller called")
        style()
        layout()
    }


}

extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        //Sign In button style modifier
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        //Sign In error message label style modifier
        errorSignInMsg.textColor = .systemRed
        errorSignInMsg.textAlignment = .center
        errorSignInMsg.numberOfLines = 0
        errorSignInMsg.translatesAutoresizingMaskIntoConstraints = false
        errorSignInMsg.isHidden = true
        //errorSignInMsg.text = "User name / password incorrect"
       
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorSignInMsg)
      
        
        //login View Layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
         ])
        
        //SignIn button Layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo:loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)            
        ])
        
        //SignIn error msg label Layout
        NSLayoutConstraint.activate([
            errorSignInMsg.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorSignInMsg.leadingAnchor.constraint(equalTo:signInButton.leadingAnchor),
            errorSignInMsg.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
    

}

extension LoginViewController {
    
    @objc func signInTapped() {
        errorSignInMsg.isHidden = true
        login()
        
    }
    
    private func login() {
        guard let username = userName , let password = passwd else {
            assertionFailure("Username and Password cant be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "User name / password be blank")
            return
        }
        
        if username == "John" && password == "welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect user name and password")
        }
            
    
    }
    
    private func configureView(withMessage message: String) {
        errorSignInMsg.isHidden = false
        errorSignInMsg.text = message
    }
}
