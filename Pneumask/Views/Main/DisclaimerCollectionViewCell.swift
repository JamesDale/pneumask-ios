//
//  DisclaimerCollectionViewCell.swift
//  Pneumask
//
//  Created by James Dale on 16/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class DisclaimerCollectionViewCell: UICollectionViewCell, MainCollectionViewCell {
    static let reuseIdentifier = "disclaimerCollectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Disclaimer"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let disclaimerLabel: UILabel = {
        let label = UILabel()
        label.text = """
        The following content, including but not limited to project descriptions, preliminary test results, figures/images, and prototypes, published here is meant to maximize potential public benefit during this SARS-CoV-2 (formerly CoVID-19) crisis, specifically in addressing the urgent need around PPE shortage. The content is currently being submitted to the U.S. Food and Drug Administration (FDA) for review and approval. \n
        PLEASE NOTE: The content has not been peer reviewed. The Authors make no representations or warranties of any kind (express or implied) relating to accuracy, safety, usefulness, usability, marketability, performance, or otherwise of the content released here. The Authors disclaim all express and implied warranties of merchantability and fitness of the content for a particular purpose, and disclaims all express and implied warranties regarding non-infringement of any patent, copyright, trademark, or other rights of third parties in the content or use of the content, or in the making, using, or selling products or services by any person or entity. \n
        People or entities attempting to use the content in any way, including creating products or offering services, assume all risk and responsibility related to those uses, including all legal and regulatory compliance, safety, efficacy, performance, design, marketability, title, and quality. The Authors assume no liability related to the actions of third parties and in respect of any infringement of any patent, copyright, or other right of third parties.
        The content/device has not been used in formal testing with human subjects at this time.
        """
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(disclaimerLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        disclaimerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        disclaimerLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: contentView.topAnchor),
            leftAnchor.constraint(equalTo: contentView.leftAnchor),
            rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            
            disclaimerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            disclaimerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            disclaimerLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            
            bottomAnchor.constraint(equalTo: disclaimerLabel.bottomAnchor, constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

