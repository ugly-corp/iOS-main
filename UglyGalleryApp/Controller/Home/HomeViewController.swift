//
//  HomeViewController.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var galleryViewModel = HomeGalleryViewModel()
    
    private var galleryCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private var segmentControl = UISegmentedControl()
    
    var segments = ["Все", "Авторы"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
}

//MARK: Setup UI
extension HomeViewController {
    
    func setupUI() {
        setupNavbarItem()
        setupCollectionView()
        setupSegmentControll()
        addSubViews()
        makeConstrants()
        loadGalleryData()
    }
    
    func setupNavbarItem() {
        self.navigationItem.title = "UG"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "American Typewriter Bold", size: 32), size: 32)]
    }
    
    func setupCollectionView() {
        galleryCollectionView.register(UglyGalleryCollectionViewCell.self, forCellWithReuseIdentifier: UglyGalleryCollectionViewCell.identifier)
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
    }
    
    func setupSegmentControll() {
        segmentControl = UISegmentedControl(items: segments)
        segmentControl.backgroundColor = .mainGray
        segmentControl.selectedSegmentTintColor = .mainBlack
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(selectedSegmens), for: .valueChanged)
    }
    
    func addSubViews() {
        [galleryCollectionView, segmentControl].forEach {
            view.addSubview($0)
        }
    }
    
    func makeConstrants() {
        galleryCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        segmentControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(130)
            make.width.equalTo(164)
            make.height.equalTo(27)
        }
    }
    
    func loadGalleryData() {
        DispatchQueue.main.async {
            self.galleryViewModel.fetchGallery()
            self.galleryViewModel.galleryDelegate = self
        }
    }
    
    @objc func selectedSegmens(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
        }
    }
}

//MARK: Services
extension HomeViewController: Services {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.galleryCollectionView.reloadData()
        }
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryViewModel.homeGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UglyGalleryCollectionViewCell.identifier, for: indexPath) as? UglyGalleryCollectionViewCell else { return UICollectionViewCell() }
        
        let galleryContent = galleryViewModel.homeGallery.safeObject(at: indexPath.row)
        cell.galleryImages = galleryContent
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 3 * 15) / 2
        
        return CGSize(width: width, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

