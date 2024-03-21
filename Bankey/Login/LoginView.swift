//
//  LoginView.swift
//  Bankey
//
//  Created by Thilagawathy Duraisamy on 20/3/2024.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let stackView = UIStackView()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 200)
//    }
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        
        //Stack view style modifier
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        //Title label style modifier
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.isHidden = false
        titleLabel.text = "Bankey"
       
        //User name textfield style modifier
        userNameTextField.delegate = self
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
       // userNameTextField.borderStyle = .roundedRect
        
        //Password textfiled style modifier
        passwordTextField.delegate = self
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
       // passwordTextField.borderStyle = .roundedRect
        
        //Divider style modifier
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        
        //CALayer style modifier
        layer.cornerRadius = 5
        clipsToBounds = true
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(titleLabel)
        
        addSubview(stackView)
        
        //Layout of username and password textfield
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
      return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
