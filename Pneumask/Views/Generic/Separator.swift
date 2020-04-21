//
//  Separator.swift
//  Pneumask
//
//  Created by James Dale on 21/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class UISeparator: UIView {

  init() {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .secondarySystemBackground
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: 2)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
