//
//  UIViewController + StoryBoard.swift
//  MyMusic
//
//  Created by Dennis Zubkoff on 01.03.2020.
//  Copyright © 2020 Denis Zubkov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
    
}
