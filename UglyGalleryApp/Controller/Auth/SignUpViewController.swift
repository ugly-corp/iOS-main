//
//  RegistrationViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private var accauntLable = LabelType(type: .accountAdd)
    private var userNameLable = LabelType(type: .userName)
    private var emailLabel = LabelType(type: .email)
    private var passwordLabel = LabelType(type: .password)
    
    private var userNameTextField = TextFieldType(type: .userName)
    private var emailTextField = TextFieldType(type: .email)
    private var passswordTextField = TextFieldType(type: .password)
    
    private let makeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavbarItem()
        setupButton()
        addSubviews()
        makeConstraints()
    }
}

//MARK: Exstension RegistrationViewController
private extension SignUpViewController {
    
    func setupNavbarItem() {
        self.navigationItem.title = ""
    }
    
    func setupButton() {
        makeButton.backgroundColor = .mainGreen
        makeButton.layer.cornerRadius = 25
        makeButton.setTitle("Создать", for: .normal)
        makeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func addSubviews() {
        [accauntLable, userNameLable, userNameTextField, emailLabel, emailTextField, passwordLabel, passswordTextField, makeButton].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        accauntLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(115)
            make.left.equalToSuperview().inset(42)
            make.width.equalTo(239)
        }
        
        userNameLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(165)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        userNameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(190)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }

        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(265)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(290)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(360)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        passswordTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(385)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        makeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(750)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        let user = userNameTextField.text ?? ""
        let mail = emailTextField.text ?? ""
        let password = passswordTextField.text ?? ""
        
        if !Validator.isValidUsername(for: user) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        if !Validator.isValidEmail(for: mail) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        if !Validator.isPasswordValid(for: password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        let entanceVC = SignInViewController()
        navigationController?.pushViewController(entanceVC, animated: true)
    }
}
