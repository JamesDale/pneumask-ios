//
//  ResourceView.swift
//  Pneumask
//
//  Created by James Dale on 18/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class ResourceView: UIButton {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let resourceTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let resourceIconView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "safari.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .secondarySystemFill
        layer.cornerRadius = 8
        
        addSubview(stackView)
        stackView.addArrangedSubview(resourceTitleLabel)
        stackView.addArrangedSubview(resourceIconView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
