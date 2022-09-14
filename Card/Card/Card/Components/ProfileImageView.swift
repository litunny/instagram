//
//  ProfileImageView.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

final class ProfileImageView: UIView {
    private let standardPadding: CGFloat = 10
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        imageView.layer.borderColor = InstaColor.black.cgColor
        imageView.setDimensions(size: InstaSize.innerSmall)
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 36/2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    private func setupView() {
        layoutMargins = UIEdgeInsets(
            top: standardPadding,
            left: standardPadding,
            bottom: standardPadding,
            right: standardPadding
        )
       
        addSubview(profileImageView)
        profileImageView.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
