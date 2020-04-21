//
//  UIView+Extensions.swift
//  Pneumask
//
//  Created by James Dale on 21/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

extension UIView {
  func onTap(_ target: Any, action: Selector) {
    let gesture = UITapGestureRecognizer(target: target, action: action)
    gesture.numberOfTouchesRequired = 1
    addGestureRecognizer(gesture)
    isUserInteractionEnabled = true
  }
}
