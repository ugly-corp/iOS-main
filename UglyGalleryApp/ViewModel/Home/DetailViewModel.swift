//
//  DetailViewModel.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 10.03.2024.
//

import UIKit

class DetailViewModel {
    
    var details: GalleryModel?
    
    init(detail: GalleryModel?) {
        self.details = detail
    }
    
    var imageWork: String? {
        return details?.url
    }
    
    var description: String? {
        return details?.title
    }
}



//class DetailViewModel {
//
//    var details: [HomeGalleryModel] = [] {
//        didSet {
//            self.detailDelegate?.reloadData()
//        }
//    }
//    weak var detailDelegate: Services?
//    private let manager = ApiManager()
//
//    func fetchGallery() {
//        manager.apiRequest(url: Constant.galleryURL, expecting: [HomeGalleryModel].self) { [weak self] result in
//            switch result {
//            case .success(let newImage):
//                DispatchQueue.main.async {
//                    self?.details = newImage
//                }
//            case .failure(let error):
//                print("Error viewModel: \(error)")
//            }
//        }
//    }
//}
//
