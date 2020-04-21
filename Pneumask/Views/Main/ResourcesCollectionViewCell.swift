//
//  ResourcesCollectionViewCell.swift
//  Pneumask
//
//  Created by James Dale on 17/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class ResourcesCollectionViewCell: UICollectionViewCell, MainCollectionViewCell {
    static let reuseIdentifier = "resourcesCollectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Resources"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(stackView)
        
        let resources: [ResourceView] = [
        {
            let resourceView = ResourceView()
            resourceView.resourceTitleLabel.text = "About Pneumask"
            return resourceView
        }(),
        {
            let resourceView = ResourceView()
            resourceView.resourceTitleLabel.text = "Donning and Doffing Procedure"
            return resourceView
        }(),
        {
            let resourceView = ResourceView()
            resourceView.resourceTitleLabel.text = "Decontamination Procedure"
            return resourceView
        }(),
        {
            let resourceView = ResourceView()
            resourceView.resourceTitleLabel.text = "Donate"
            return resourceView
        }()
        ]
        
        resources.forEach { stackView.addArrangedSubview($0) }
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
