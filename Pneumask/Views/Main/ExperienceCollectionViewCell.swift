//
//  ExperienceCollectionViewCell.swift
//  Pneumask
//
//  Created by James Dale on 16/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class ExperienceCollectionViewCell: UICollectionViewCell, MainCollectionViewCell {
    static let reuseIdentifier = "experienceCollectionViewCell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let maskImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Pneumask"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Experience Pneumask"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap here to experience pneumask firsthand"
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        
        addSubview(stackView)
        stackView.addArrangedSubview(maskImageView)
        stackView.addArrangedSubview(textStackView)
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            textStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
