//
//  AmplifierCollectionViewCell.swift
//  Pneumask
//
//  Created by James Dale on 21/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class AmplifierDeviceCollectionViewCell: UICollectionViewCell, MainCollectionViewCell {

  static let reuseIdentifier = "amplifierDeviceCollectionViewCell"

  let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 8
    return stackView
  }()

  let maskImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "mic.fill"))
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "James' AirPods Pro"
    label.numberOfLines = 0
    return label
  }()

  let audioControlStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.distribution = .fillEqually
    stackView.spacing = 8
    return stackView
  }()

  let muteButton: UIButton = {
    let button = UIButton()
    button.setTitle("Mute", for: .normal)
    button.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
    button.tintColor = .label
    button.setTitleColor(.label, for: .normal)
    button.backgroundColor = .secondarySystemFill
    button.layer.cornerRadius = 8
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
    return button
  }()

  let disconnectButton: UIButton = {
    let button = UIButton()
    button.setTitle("Disconnect", for: .normal)
    button.setImage(UIImage(systemName: "mic.slash.fill"), for: .normal)
    button.tintColor = .label
    button.setTitleColor(.label, for: .normal)
    button.backgroundColor = .secondarySystemFill
    button.layer.cornerRadius = 8
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .systemBackground
    layer.cornerRadius = 12

    addSubview(stackView)
    stackView.addArrangedSubview(maskImageView)
    stackView.addArrangedSubview(descriptionLabel)

    addSubview(audioControlStackView)
    audioControlStackView.addArrangedSubview(muteButton)
    audioControlStackView.addArrangedSubview(disconnectButton)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    maskImageView.translatesAutoresizingMaskIntoConstraints = false
    audioControlStackView.translatesAutoresizingMaskIntoConstraints = false

    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

      audioControlStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
      audioControlStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      audioControlStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      audioControlStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

      descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),

      heightAnchor.constraint(greaterThanOrEqualToConstant: 60),

      maskImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 22),
      maskImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 22),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
