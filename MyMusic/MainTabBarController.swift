//
//  MainTabBarController.swift
//  MyMusic
//
//  Created by Dennis Zubkoff on 28.02.2020.
//  Copyright © 2020 Denis Zubkov. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.1567853093, blue: 0.3175118566, alpha: 1)
        
        let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
    

        viewControllers = [
            generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "ios10-apple-music-search-5nav-icon"), title: "Поиск"),
            generateViewController(rootViewController: ViewController(), image: #imageLiteral(resourceName: "ios10-apple-music-library-5nav-icon"), title: "Каталог"),
         ]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.image = image
        navigationViewController.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationViewController.navigationBar.prefersLargeTitles = true
        return navigationViewController
    }
}
