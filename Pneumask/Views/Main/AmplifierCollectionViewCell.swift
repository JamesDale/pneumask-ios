//
//  AmplifierCollectionViewCell.swift
//  Pneumask
//
//  Created by James Dale on 18/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class AmplifierCollectionViewCell: UICollectionViewCell, MainCollectionViewCell {

  static let reuseIdentifier = "amplifierCollectionViewCell"

  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 8
    return stackView
  }()

  let maskImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "waveform"))
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Tap to enable the voice amplifier"
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
      stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
      stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

      descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),

      bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),

      contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
