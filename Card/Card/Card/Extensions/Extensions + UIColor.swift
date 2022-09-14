//
//  Extensions + UIColor.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

enum ColorPallete: String {
    case white, black
}

struct InstaColor {
    static let white: UIColor = UIColor(color: .white)!
    static let black: UIColor = UIColor(color: .black)!
}

extension UIColor {
    convenience init?(color: ColorPallete) {
        self.init(named: color.rawValue)
    }
}
