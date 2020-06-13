//
//  CircleButton.swift
//  Pneumask
//
//  Created by James Dale on 25/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class CircleButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        updateCorners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCorners()
    }
    
    private func updateCorners() {
        self.layer.cornerRadius = frame.width / 2
    }
    
}
