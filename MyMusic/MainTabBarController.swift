//
//  MainTabBarController.swift
//  MyMusic
//
//  Created by Dennis Zubkoff on 28.02.2020.
//  Copyright © 2020 Denis Zubkov. All rights reserved.
//

import UIKit

protocol MainTabBarConrollerDelegate: class {
    func minimizeTrackDetail()
}

class MainTabBarController: UITabBarController {
    
    var minimizedTopAnchorConstraint: NSLayoutConstraint!
    var maximizedTopAnchorConstraint: NSLayoutConstraint!
    private var bottomAnchorConstraint: NSLayoutConstraint!
    let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.1567853093, blue: 0.3175118566, alpha: 1)
        setupTrackDetailView()
        
    

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
    
    
    
    private func setupTrackDetailView() {
        print("setup TDV")
        
        let trackDetailView: TrackDetailView = TrackDetailView.loadFromNib()
        trackDetailView.backgroundColor = .green
        trackDetailView.tabBarDelegate = self
        trackDetailView.delegate = searchVC
        view.insertSubview(trackDetailView, belowSubview: tabBar)
        
        trackDetailView.translatesAutoresizingMaskIntoConstraints = false
        maximizedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor)
        minimizedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
        bottomAnchorConstraint = trackDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height)
        maximizedTopAnchorConstraint.isActive = true
        bottomAnchorConstraint.isActive = true
        
        trackDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trackDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
}

extension MainTabBarController: MainTabBarConrollerDelegate {
    func minimizeTrackDetail() {
        
        maximizedTopAnchorConstraint.isActive = false
        minimizedTopAnchorConstraint.isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
}
