//
//  ProfileImageView.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

///The profile image status signifies if the said user has an on-going
///status to be viewed, so the enum values signifies i.e. expired (no status)
///or opened (there's an on-going) status lasted for 24 hours
enum ProfileImageStatus {
    case expired, opened
}

///The profile size is an implementation for any profile circular view
///to be re-used programmatically anywhere in the codebase
///according to the enumerated value
enum ProfileSize {
    case small, medium, large
    
    ///The ringSize computed property, returns enumerated
    ///value for the outer-most (hallow) layer of the profile value in size
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

///Profile image view is the standard and stand-alone view, that encompasses
///the logic and mechanism around profile view, this view will be bindable to
///the current logged on user, and will react to click event when clicked upon
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
    public var profileImageStatus: ProfileImageStatus = .expired {
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
                            withStatus status: ProfileImageStatus = .expired,
                            forSize size: ProfileSize
    ) {
        self.init(with: image, withStatus: status)
        self.profileImageSize = size
        self.setupView()
    }
    
    public convenience init(with image: UIImage,
                            withStatus status: ProfileImageStatus = .expired
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
