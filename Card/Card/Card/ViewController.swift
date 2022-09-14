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
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.backgroundColor = UIColor(named: "white")
        return view
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        imageView.setDimensions(width: 50, height: 50)
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "white")
        self.setupView()
        self.setupConstraints()
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
                profileImageView
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
    }
}
