//
//  Extensions + UIView.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
  case topRightBottomLeft
  case topLeftBottomRight
  case horizontal
  case vertical

  var startPoint: CGPoint {
    return points.startPoint
  }

  var endPoint: CGPoint {
    return points.endPoint
  }

  var points: GradientPoints {
    switch self {
    case .topRightBottomLeft:
      return (CGPoint(x: 0.0, y: 1.0), CGPoint(x: 1.0, y: 0.0))
    case .topLeftBottomRight:
      return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 1.0))
    case .horizontal:
      return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 0.0))
    case .vertical:
      return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 0.0, y: 1.0))
    }
  }
}

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
    
    func addGradient(startColor: UIColor, endColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.masksToBounds = true
        
        layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(with colors: [UIColor],
                       gradientOrientation orientation: GradientOrientation,
                       width: CGFloat,
                       height: CGFloat
    ) {
       let gradient = CAGradientLayer()
       gradient.frame = CGRect(x: 0, y: 0, width: width, height: height)
       gradient.colors = colors.map { $0.cgColor }
       gradient.startPoint = orientation.startPoint
       gradient.endPoint = orientation.endPoint
       gradient.borderColor = self.layer.borderColor
       gradient.borderWidth = self.layer.borderWidth
       gradient.cornerRadius = height/2
       gradient.masksToBounds = true
       gradient.isHidden = false

       self.layer.insertSublayer(gradient, at: 0)
     }
    
    func applyGradient(with colors: [UIColor],
                       gradientOrientation orientation: GradientOrientation,
                       size: ProfileImageSize
    ) {
       let gradient = CAGradientLayer()
       gradient.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
       gradient.colors = colors.map { $0.cgColor }
       gradient.startPoint = orientation.startPoint
       gradient.endPoint = orientation.endPoint
       gradient.borderColor = self.layer.borderColor
       gradient.borderWidth = self.layer.borderWidth
       gradient.cornerRadius = size.height/2
       gradient.masksToBounds = true
       gradient.isHidden = false

       self.layer.insertSublayer(gradient, at: 0)
     }
}
