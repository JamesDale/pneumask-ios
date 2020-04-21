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

  let seperator = UISeparator()

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
    contentView.addSubview(seperator)
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

    updateConstraints()

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func resourceTapped(sender: UITapGestureRecognizer) {
    guard let resourceView = sender.view as? ResourceButton else { return }
    delegate?.resourceSelected(resourceView.resource)
  }

  // NOTE:
  // Ideally we can set the bottom anchor here and reload the cell if needed.
  // Unfortunately, due to https://openradar.appspot.com/23728611
  // We need to set the height constraint manually. 🤮
  // Right now, we just avoid reloading this cell. But if it ever comes to it...

  override func updateConstraints() {
    super.updateConstraints()

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    seperator.translatesAutoresizingMaskIntoConstraints = false
    stackView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

      seperator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      seperator.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      seperator.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

      stackView.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 12),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

      bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
    ])
  }
}
