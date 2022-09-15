//
//  ProfileImageView.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit
enum ProfileImageStatus {
    case closed, opened
}

enum ProfileSize {
    case small, medium, large
    
    var ringSize: ProfileImageSize {
        switch self {
            case .small:
                return InstaSize.small
            default:
                return InstaSize.medium
        }
    }
    
    var innerSize: ProfileImageSize {
        switch self {
            case .small:
                return InstaSize.innerSmall
                
            default:
                return InstaSize.innerMedium
        }
    }
}

final class ProfileImageView: UIView {
    
    ///Profile Image of the current user
    public var profileImage: UIImage = #imageLiteral(resourceName: "avatar") {
        didSet {
            profileImageView.image = profileImage
            setupView()
        }
    }
    
    ///Profile Status i.e. Closed or Opened
    ///This will allow to show the gradient
    public var profileImageStatus: ProfileImageStatus = .closed {
        didSet {
            self.setProfileStatus(to: profileImageStatus)
        }
    }
    
    ///Profile Image Size: i.e. small, medium, large
    ///This will be a determinant for overall size of the profile, inorder to re-usable
    public var profileImageSize: ProfileSize = .small {
        didSet{
            setInnerProfileImageSize(to: profileImageSize)
        }
    }
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: self.profileImage)
        imageView.layer.borderColor = InstaColor.black.cgColor
        imageView.layer.borderWidth = CGFloat.one
        imageView.layer.cornerRadius = profileImageSize.innerSize.height * 0.5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setProfileStatus(to status: ProfileImageStatus) {
        if status == .opened {
            self.applyGradient(
                with: [.purple, .red, .orange, .yellow],
                gradientOrientation: .vertical,
                size: self.profileImageSize.ringSize
            )
        }
    }
    
    private func setInnerProfileImageSize(to size: ProfileSize) {
        profileImageView.setDimensions(size: size.innerSize)
    }
    
    private func setupView() {
        addSubview(profileImageView)
        profileImageView.center(inView: self)
        setInnerProfileImageSize(to: self.profileImageSize)
    }
    
    public init(image: UIImage) {
        super.init(frame: .zero)
        self.profileImage = image
        self.setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
