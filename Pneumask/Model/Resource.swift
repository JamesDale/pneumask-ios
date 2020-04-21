//
//  Resource.swift
//  Pneumask
//
//  Created by James Dale on 21/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

struct Resource {

  let title: String
  let url: URL?
  let icon: UIImage?

  init(title: String, url: URL, icon: UIImage?) {
    self.title = title
    self.url = url
    self.icon = icon
  }

  init(_ title: String) {
    self.title = title
    self.icon = nil
    self.url = nil
  }

  init(_ title: String, url: URL) {
    self.title = title
    self.url = url
    self.icon = nil
  }

}
