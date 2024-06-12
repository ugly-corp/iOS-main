//
//  EntranceViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    private var enterLabel = LabelType(type: .enter)
    private var emailLabel = LabelType(type: .email)
    private var passwordLabel = LabelType(type: .password)
    
    private var emailTextField = TextFieldType(type: .email)
    private var passswordTextField = TextFieldType(type: .password)
    
    private var enterButton = UIButton()
    private var reminderButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
}

//MARK: Setup UI
private extension SignInViewController {
    
    func setupUI() {
        setupNavbarItem()
        createButtons()
        textFieldDelegete()
        addSubviews()
        makeConstraints()
    }
    
    func setupNavbarItem() {
        self.navigationItem.title = ""
    }
    
    func createButtons() {
        enterButton.backgroundColor = .mainGreen
        enterButton.layer.cornerRadius = 25
        enterButton.setTitle("Войти", for: .normal)
        enterButton.setTitleColor(.mainBlack, for: .normal)
        enterButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        reminderButton.setTitle("Забыли пароль?", for: .normal)
        reminderButton.setTitleColor(.mainGray, for: .normal)
        reminderButton.addTarget(self, action: #selector(reminderAction), for: .touchUpInside)
    }
    
    func textFieldDelegete() {
        emailTextField.delegate = self
        passswordTextField.delegate = self
    }
    
    func addSubviews() {
        [enterLabel, emailLabel, emailTextField, passwordLabel, passswordTextField, enterButton, reminderButton].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        enterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(115)
            make.left.equalToSuperview().inset(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(165)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(190)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(260)
            make.left.equalToSuperview().inset(50)
            make.width.equalTo(152)
        }
        
        passswordTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(285)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        reminderButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(719)
            make.left.equalToSuperview().inset(137)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(750)
            make.left.equalToSuperview().inset(45)
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        let mail = emailTextField.text ?? ""
        let password = passswordTextField.text ?? ""
        
        if !Validator.isValidEmail(for: mail) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        if !Validator.isPasswordValid(for: password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        let homeVC = TabbarViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc: homeVC)
    }
    
    @objc func reminderAction (sender: UIButton) {
        
    }
}

//MARK: UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.mainBlack.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.mainGray.cgColor
    }
}
