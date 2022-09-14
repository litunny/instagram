//
//  ViewController.swift
//  Card
//
//  Created by Osinnowo Emmanuel on 14/09/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = InstaColor.white
        return view
    }()
    
    private lazy var profileImageView: ProfileImageView = {
        let imageView = ProfileImageView()
        imageView.setDimensions(size: InstaSize.small)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "loganpaul"
        title.font = InstaFont.boldTitle
        title.textColor = InstaColor.black
        return title
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "The Moon"
        title.font = InstaFont.small
        title.textColor = InstaColor.black
        return title
    }()
    
    private lazy var checkMark: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "checkmark.seal.fill"))
        image.setDimensions(width: 11, height: 10)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.tintColor = UIColor.systemBlue
        return image
    }()
    
    private lazy var moreIcon: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "ellipsis"))
        image.setDimensions(width: 11, height: 10)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.tintColor = InstaColor.black
        return image
    }()
    
    private lazy var contentImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "post"))
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = InstaColor.white
        self.setupView()
        self.setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageView.applyGradient(
            with: [.purple, .red, .orange, .yellow],
            gradientOrientation: .vertical,
            size: InstaSize.small
        )
    }
    
    //MARK: - Selector
}

//MARK: - Constraints
extension ViewController {
    
    //Setup: - View
    private func setupView() {
        view.addSubview(cardView)
        
        cardView.addSubview(
            [
                profileImageView,
                titleLabel,
                subTitleLabel,
                checkMark,
                moreIcon,
                contentImage
            ]
        )
    }
    
    //Setup: - Constraints
    private func setupConstraints() {
        //Constraints: - Profile Image
        
        cardView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            paddingTop: 100,
            paddingBottom: 100
        )
        
        profileImageView.anchor(
            top: cardView.topAnchor,
            left: cardView.leftAnchor,
            paddingTop: 8,
            paddingLeft: 8
        )
        
        titleLabel.anchor(
            top: cardView.topAnchor,
            left: profileImageView.rightAnchor,
            paddingTop: 11,
            paddingLeft: 8
        )
        
        subTitleLabel.anchor(
            top: titleLabel.bottomAnchor,
            left: profileImageView.rightAnchor,
            paddingTop: 2,
            paddingLeft: 8
        )
        
        checkMark.anchor(
            top: titleLabel.topAnchor,
            left: titleLabel.rightAnchor,
            paddingTop: 3,
            paddingLeft: 3
        )
        
        moreIcon.anchor(
            top: cardView.topAnchor,
            right: cardView.rightAnchor,
            paddingTop: 15,
            paddingRight: 8
        )
        
        contentImage.anchor(
            top: profileImageView.bottomAnchor,
            left: cardView.leftAnchor,
            right: cardView.rightAnchor,
            paddingTop: 5,
            height: 560
        )
    }
}
