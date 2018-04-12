//
//  NibLoadableView.swift
//  tabata
//
//  Created by Forest Plasencia on 4/11/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

