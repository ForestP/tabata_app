//
//  ReusableView.swift
//  tabata
//
//  Created by Forest Plasencia on 4/11/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}

