//
//  InitialPageViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {

    private let backgroundImageView = UIImageView()
    private let titleLable = UILabel()
    private let signUpButton = UIButton()
    private let signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupUI()
    }
}

//MARK: Setup UI
private extension AuthViewController {
    
    func setupUI() {
        setupNavbarItem()
        createSubViews()
        addSubviews()
        makeConstraints()
    }
    
    func setupNavbarItem() {
        self.navigationItem.title = ""
    }
    
    func createSubViews() {
        setupImageView()
        setupLabel()
        setupButon()
    }
    
    func setupImageView() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleToFill
        view.insertSubview(backgroundImageView, at: 0)
    }
    
    func setupLabel() {
        titleLable.text = "UGLY \nGALLERY"
        titleLable.textColor = .white
        titleLable.numberOfLines = 0
        titleLable.textAlignment = .left
        titleLable.font = .systemFont(ofSize: 48)
    }
    
    func setupButon() {
        signUpButton.backgroundColor = .mainBlack
        signUpButton.setTitle("Создать аккаунт", for: .normal)
        signUpButton.addTarget(self, action: #selector(actionRegistre), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 25
        
        signInButton.backgroundColor = .mainGreen
        signInButton.setTitle("Войти", for: .normal)
        signInButton.setTitleColor(.mainBlack, for: .normal)
        signInButton.addTarget(self, action: #selector(actionEntrance), for: .touchUpInside)
        signInButton.layer.cornerRadius = 25
    }
    
    func addSubviews() {
        [titleLable, signUpButton, signInButton].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(351)
            make.left.equalToSuperview().inset(44)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(680)
            make.centerX.equalToSuperview()
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(742)
            make.centerX.equalToSuperview()
            make.width.equalTo(304)
            make.height.equalTo(52)
        }
    }
    
    @objc func actionRegistre() {
        let registreVC = SignUpViewController()
        navigationController?.pushViewController(registreVC, animated: true)
    }
    
    @objc func actionEntrance(sender: UIButton) {
        let entranceVC = SignInViewController()
        navigationController?.pushViewController(entranceVC, animated: true)
    }
}

