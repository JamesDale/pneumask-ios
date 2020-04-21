//
//  ResourcesCollectionViewCell.swift
//  Pneumask
//
//  Created by James Dale on 17/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

protocol ResourceCollectionViewCellDelegate {
  func resourceSelected(_ resource: Resource)
}

final class ResourcesCollectionViewCell: UICollectionViewCell, MainCollectionViewCell {
  static let reuseIdentifier = "resourcesCollectionViewCell"

  var delegate: ResourceCollectionViewCellDelegate?

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

    let resources: [Resource] = [
      Resource("About Pneumask", url: Constants.URLs.about),
      Resource("Donning and Doffing Procedure", url: Constants.URLs.donningAndDoffing),
      Resource("Decontamination Procedure", url: Constants.URLs.decontamination),
      Resource("Donate", url: Constants.URLs.donate),
    ]

    let resourceViews: [ResourceButton] = resources.map { ResourceButton($0) }

    for resourceView in resourceViews {
      stackView.addArrangedSubview(resourceView)
      resourceView.onTap(
        self,
        action: #selector(resourceTapped(sender:)))
    }

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    stackView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

      stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

      bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func resourceTapped(sender: UITapGestureRecognizer) {
    guard let resourceView = sender.view as? ResourceButton else { return }
    delegate?.resourceSelected(resourceView.resource)
  }
}
