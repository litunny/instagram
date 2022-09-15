//
//  ProfileImageView.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

final class ProfileImageView: UIView {
    
    public var profileImage: UIImage = #imageLiteral(resourceName: "avatar") {
        didSet {
            profileImageView.image = profileImage
            setupView()
        }
    }
    
    private let standardPadding: CGFloat = 10
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: self.profileImage)
        imageView.layer.borderColor = InstaColor.black.cgColor
        imageView.setDimensions(size: InstaSize.innerSmall)
        imageView.layer.borderWidth = CGFloat.one
        imageView.layer.cornerRadius = InstaSize.innerSmall.height * 0.5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public init(image: UIImage) {
        super.init(frame: .zero)
        self.profileImage = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    private func setupView() {
        addSubview(profileImageView)
        profileImageView.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
