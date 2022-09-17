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
            case .medium:
                return InstaSize.medium
            default:
                return InstaSize.medium
        }
    }
    
    var innerSize: ProfileImageSize {
        switch self {
            case .small:
                return InstaSize.innerSmall
                
            case .medium:
                return InstaSize.innerMedium
            
            default:
                return InstaSize.innerMedium
        }
    }
}

///Profile Image View (Circular)
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
            setupView()
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
    
    private func setRingProfileImageSize(to size: ProfileSize) {
        setDimensions(size: size.ringSize)
    }
    
    private func setupView() {
        addSubview(profileImageView)
        profileImageView.center(inView: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setRingProfileImageSize(to: self.profileImageSize)
        setInnerProfileImageSize(to: self.profileImageSize)
        setProfileStatus(to: self.profileImageStatus)
    }
    
    public convenience init(with image: UIImage,
                            withStatus status: ProfileImageStatus = .closed,
                            forSize size: ProfileSize
    ) {
        self.init(with: image, withStatus: status)
        self.profileImageSize = size
        self.setupView()
    }
    
    public convenience init(with image: UIImage,
                            withStatus status: ProfileImageStatus = .closed
    ) {
        self.init(with: image)
        self.profileImageStatus = status
        self.setupView()
    }
    
    public init(with image: UIImage) {
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
