//
//  ExperienceInfoView.swift
//  Pneumask
//
//  Created by James Dale on 23/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class ExperienceInfoView: UIView {

  let effectView: UIVisualEffectView = {
    UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
  }()

  let labelView: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.text = """
      Pneumask is a kit of parts consisting of an off-the-shelf snorkleing mask, a custom (3D-printed) adapter, and a filter/filter cartidge.

      The primary benefit of snorkleing mask is providing a full-face shield and air seal while allowing for controled intake and exhaust flows through the mask.
      """
    return label
  }()

  let supportBtn: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 4
    button.setTitle("Support the cause", for: .normal)
    return button
  }()

  let closeBtn: UIButton = {
    let button = CircularButton()
    button.backgroundColor = .systemFill
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    button.setImage(UIImage(systemName: "xmark"), for: .normal)
    button.setTitleColor(.label, for: .normal)
    button.tintColor = .label
    return button
  }()

  init() {
    super.init(frame: .zero)

    addSubview(effectView)
    addSubview(labelView)
    addSubview(supportBtn)
    addSubview(closeBtn)

    layer.cornerRadius = 8
    layer.masksToBounds = true
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func updateConstraints() {
    super.updateConstraints()

    effectView.translatesAutoresizingMaskIntoConstraints = false
    labelView.translatesAutoresizingMaskIntoConstraints = false
    supportBtn.translatesAutoresizingMaskIntoConstraints = false
    closeBtn.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      effectView.topAnchor.constraint(equalTo: topAnchor),
      effectView.bottomAnchor.constraint(equalTo: bottomAnchor),
      effectView.leadingAnchor.constraint(equalTo: leadingAnchor),
      effectView.trailingAnchor.constraint(equalTo: trailingAnchor),

      closeBtn.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      closeBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      closeBtn.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
      closeBtn.widthAnchor.constraint(equalTo: closeBtn.heightAnchor),

      supportBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      supportBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      supportBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

      labelView.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 2),
      labelView.bottomAnchor.constraint(equalTo: supportBtn.topAnchor, constant: 8),
      labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
    ])
  }
}
