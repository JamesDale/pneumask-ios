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

  let maskImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "arkit"))
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Tap to experience trying on pneumask"
    label.numberOfLines = 0
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .systemBackground
    layer.cornerRadius = 12

    addSubview(stackView)
    stackView.addArrangedSubview(maskImageView)
    stackView.addArrangedSubview(descriptionLabel)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

      descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),

      bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
