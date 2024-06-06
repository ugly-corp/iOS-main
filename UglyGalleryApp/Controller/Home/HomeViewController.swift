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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createNavbarItem()
        createSubview()
        makeConstrants()
        loadGalleryData()
    }
}

extension HomeViewController {
    
    func createNavbarItem() {
        self.navigationItem.title = "UG"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "American Typewriter Bold", size: 32), size: 32)]
    }
    
    func createSubview() {
        galleryCollectionView.register(UglyGalleryCollectionViewCell.self, forCellWithReuseIdentifier: UglyGalleryCollectionViewCell.identifier)
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        view.addSubview(galleryCollectionView)
    }
    
    func makeConstrants() {
        galleryCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func loadGalleryData() {
        DispatchQueue.main.async {
            self.galleryViewModel.fetchGallery()
            self.galleryViewModel.galleryDelegate = self
        }
    }
}

extension HomeViewController: Services {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.galleryCollectionView.reloadData()
        }
    }
}

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

//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    guard let film = dataSource?.itemIdentifier(for: indexPath) else { return }
//    let detailedVC = DetailedViewController()
//
//    NetworkManager.shared.fetchDetailedData(filmId: film.id) { [weak self] result  in
//        switch result {
//        case let .success(film):
//            guard let url = URL(string: film.image) else { return }
//            guard let data = try? Data(contentsOf: url) else { return }
//
//            let image = UIImage(data: data) ?? UIImage()
//            let attributedTitle = NSAttributedString(string: film.fullTitle, attributes: Text.attributes)
//            let attributedFilmInfo = NSAttributedString(string: "Description: \(film.plot)" , attributes: Text.attributes)
//
//            DispatchQueue.main.async {
//                detailedVC.filmTitleLabel.attributedText = attributedTitle
//                detailedVC.filmInfoTextView.attributedText = attributedFilmInfo
//                detailedVC.filmCoverImageView.image = image
//                detailedVC.hideLoader()
//            }
//
//        case let .failure(error):
//            self?.showAlert(error: error)
//        }
//    }
//
//    detailedVC.showLoader()
//    self.navigationController?.pushViewController(detailedVC, animated: true)
//}
