//
//  ResourceView.swift
//  Pneumask
//
//  Created by James Dale on 18/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class ResourceView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    let resourceTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let resourceIconView: UIImageView = {
        UIImageView(image: UIImage(systemName: "safari.fill"))
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(stackView)
        stackView.addArrangedSubview(resourceTitleLabel)
        stackView.addArrangedSubview(resourceIconView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
