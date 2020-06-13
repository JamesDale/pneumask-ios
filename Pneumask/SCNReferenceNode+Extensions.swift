//
//  SCNReferenceNode+Extensions.swift
//  Pneumask
//
//  Created by James Dale on 23/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import SceneKit

extension SCNReferenceNode {
  convenience init(named resourceName: String, loadImmediately: Bool = true) {
    let url = Bundle.main.url(
      forResource: resourceName, withExtension: "scn",
      subdirectory: "Models.scnassets")!
    self.init(url: url)!
    if loadImmediately {
      self.load()
    }
  }
}
