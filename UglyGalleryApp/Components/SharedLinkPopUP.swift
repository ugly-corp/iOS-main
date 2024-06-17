//
//  SharedLinkPopUP.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 17.06.2024.
//

import UIKit
import SnapKit

class SharedLinkPopUP: UIView {
    
    private let container = UIView()
    private let linkLabel = LabelType(type: .sharedLink)
    private let linkTextField = TextFieldType(type: .sharedLink)
    private let closeSharedViewButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: Setup UI
private extension SharedLinkPopUP {
    
    func setupViews() {
        setupView()
        setupCloseButton()
        addSubViews()
        makeConstraints()
        animateIn()
    }
    
    func setupView() {
        self.backgroundColor = .mainGray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        
        container.backgroundColor = .white
        container.layer.cornerRadius = 24
    }
    
    func setupCloseButton() {
        closeSharedViewButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeSharedViewButton.tintColor = .mainBlack
        closeSharedViewButton.addTarget(self, action: #selector(closeSharedViewButtonTapped), for: .touchUpInside)
    }
    
    func addSubViews() {
        addSubview(container)
        
        [linkLabel, linkTextField, closeSharedViewButton].forEach {
            container.addSubview($0)
        }
    }
    
    func makeConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(170)
            make.left.right.equalToSuperview().inset(23)
            make.width.equalTo(348)
            make.height.equalTo(234)
        }
        
        closeSharedViewButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(30)
            make.size.equalTo(13)
        }
        
        linkLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(199)
            make.height.equalTo(23)
        }
        
        linkTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.centerX.equalToSuperview()
            make.width.equalTo(256)
            make.height.equalTo(33)
        }
    }
    
    func animateIn() {
        self.container.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.container.transform = .identity
            self.alpha = 1
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.container.transform = CGAffineTransform(scaleX: 0, y: -self.frame.height)
            self.alpha = 0
        } completion: { complete in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc func closeSharedViewButtonTapped() {
        animateOut()
    }
}

