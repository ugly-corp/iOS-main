//
//  DetailTableViewCell.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 10.03.2024.
//

import UIKit

//class DetailTableViewCell: UITableViewCell {
//    
//    static let identifier = "cell"
//    
//    
//    
//    var details: HomeGalleryModel? {
//        didSet {
//            galleryConfigureUI()
//        }
//    }
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        createViews()
//        createButtons()
//        addSubviews()
//        makeConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension DetailTableViewCell {
//    
//    func createViews() {
//        userImage.layer.cornerRadius = 50
//        userImage.tintColor = .systemGray2
//        
//        descriptionWorkLabel.textColor = .black
//        descriptionWorkLabel.textAlignment = .left
//        descriptionWorkLabel.font = .systemFont(ofSize: 14)
//        descriptionWorkLabel.numberOfLines = 0
//    }
//    
//    func createButtons() {
//        hearthButton.tintColor = .systemGray2
//        hearthButton.addTarget(self, action: #selector(hearthButtonTapped), for: .touchUpInside)
//        
//        infoButton.tintColor = .systemGray2
//        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
//    }
//    
//    func addSubviews() {
//        [userImage, authorNameLabel, imageWorkToUser, descriptionTitleLabel, descriptionWorkLabel, hearthButton, infoButton].forEach {
//            contentView.addSubview($0)
//        }
//    }
//    
//    func makeConstraints() {
//        userImage.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(101)
//            make.left.equalToSuperview().inset(40)
//            make.size.equalTo(39)
//        }
//        
//        authorNameLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(109)
//            make.left.equalTo(userImage.snp.right).offset(10)
//        }
//        
//        imageWorkToUser.snp.makeConstraints { make in
//            make.top.equalTo(authorNameLabel.snp.bottom).offset(30)
//            make.centerX.equalToSuperview()
//            make.size.equalTo(307)
//        }
//        
//        descriptionTitleLabel.snp.makeConstraints { make in
//            make.top.equalTo(imageWorkToUser.snp.bottom).offset(25)
//            make.left.equalToSuperview().inset(30)
//        }
//        
//        descriptionWorkLabel.snp.makeConstraints { make in
//            make.top.equalTo(descriptionTitleLabel.snp.bottom).offset(15)
//            make.left.right.equalToSuperview().inset(25)
//        }
//    }
//    
//    func galleryConfigureUI() {
//        guard let details else { return }
//        id.self = details.id
//        userImage.image = UIImage(systemName: "person.circle")
//        authorNameLabel.text = "Имя пользователя"
//        imageWorkToUser.loadImage(from: details.url)
//        descriptionTitleLabel.text = "Описание"
//        descriptionWorkLabel.text = details.title
//    }
//    
//    @objc func hearthButtonTapped() {
//        
//    }
//    
//    @objc func infoButtonTapped() {
//        
//    }
//}
