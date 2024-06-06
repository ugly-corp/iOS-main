//
//  TabbarViewController\.swift
//  UglyGalleryApp
//
//  Created by Константин Евсюков on 05.03.2024.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
        setTabbarAppearance()
    }
}

private extension TabbarViewController {
    
    private func configureTabs() {
        let homeViewController = HomeViewController()
        let categoryViewContrller = CategoryViewController()
        let favoritesViewController = FavouritesViewController()
        let profileViewController = ProfileViewController()
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        categoryViewContrller.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        favoritesViewController.tabBarItem.image = UIImage(systemName: "heart")
        profileViewController.tabBarItem.image = UIImage(systemName: "person")
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let categoryNavigationController = UINavigationController(rootViewController: categoryViewContrller)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
        
        setViewControllers([homeNavigationController, categoryNavigationController, favoritesNavigationController, profileNavigationController], animated: true)
    }
     
    func setTabbarAppearance() {
        let positionOnX: CGFloat = 50
        let positionOnY: CGFloat = 8
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY         
        let roundLayer = CAShapeLayer()
        
        let bezierPatch = UIBezierPath(
            roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height),
            cornerRadius: height / 2)
        
        roundLayer.path = bezierPatch.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 9
        tabBar.itemPositioning = .centered
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .clear
        tabBar.shadowImage = UIImage()
        
        roundLayer.fillColor = UIColor.mainBlack.cgColor
        tabBar.tintColor = .tabbarItemAccent
        tabBar.unselectedItemTintColor = .tabbarItemLight
    }
}
