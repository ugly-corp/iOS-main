//
//  InfoWorkPopUp.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 17.06.2024.
//

import UIKit
import SnapKit

class InfoWorkPopUp: UIView {
    
    private let container = UIView()
    private let datePublictitleLabel = LabelType(type: .datePublic)
    private let datelabel = LabelType(type: .date)
    private let categotyTitleLabel = LabelType(type: .categoryTitle)
    private let categoryLabel = LabelType(type: .category)
    private let previewLabel = LabelType(type: .preview)
    private let previewQuantity = LabelType(type: .previewQuantity)
    private let closeInfoWorkViewButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoWorkPopUp {
    
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
        closeInfoWorkViewButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeInfoWorkViewButton.tintColor = .mainBlack
        closeInfoWorkViewButton.addTarget(self, action: #selector(closeButton), for: .touchUpInside)
    }
    
    func addSubViews() {
        addSubview(container)
        
        [datePublictitleLabel, datelabel, categotyTitleLabel, categoryLabel, previewLabel, previewQuantity, closeInfoWorkViewButton].forEach {
            container.addSubview($0)
        }
    }
    
    func makeConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(450)
            make.left.right.equalToSuperview().inset(23)
            make.width.equalTo(348)
            make.height.equalTo(242)
        }
        
        closeInfoWorkViewButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(30)
            make.size.equalTo(13)
        }
        
        datePublictitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.equalToSuperview().inset(30)
            make.width.equalTo(199)
            make.height.equalTo(23)
        }
        
        datelabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.left.equalToSuperview().inset(30)
            make.width.equalTo(256)
            make.height.equalTo(33)
        }
        
        categotyTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(110)
            make.left.equalToSuperview().inset(30)
            make.width.equalTo(256)
            make.height.equalTo(33)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(130)
            make.left.equalToSuperview().inset(30)
            make.width.equalTo(256)
            make.height.equalTo(33)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(170)
            make.left.equalToSuperview().inset(30)
            make.width.equalTo(256)
            make.height.equalTo(33)
        }
        
        previewQuantity.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(190)
            make.left.equalToSuperview().inset(30)
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
    
    @objc func closeButton() {
        animateOut()
    }
}

