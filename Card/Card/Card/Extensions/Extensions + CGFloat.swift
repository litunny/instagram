//
//  Extensions + CGFloat.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

typealias ProfileImageSize = (width: CGFloat, height: CGFloat)

public struct InstaSize {
    static let small: ProfileImageSize = (width: 40, height: 40)
    static let innerSmall: ProfileImageSize = (width: 36, height: 36)
    
    static let medium: ProfileImageSize = (width: 60, height: 60)
    static let innerMedium: ProfileImageSize = (width: 50, height: 50)
}

extension CGFloat {
    static let one: CGFloat = 1
}
