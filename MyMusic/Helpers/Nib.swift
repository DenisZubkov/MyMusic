//
//  Nib.swift
//  MyMusic
//
//  Created by Dennis Zubkoff on 04.03.2020.
//  Copyright © 2020 Denis Zubkov. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T:UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
