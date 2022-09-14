//
//  Extensions + UIView.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

extension UIView {
    func addSubview(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    func addSubview(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}
