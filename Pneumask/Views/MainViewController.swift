//
//  ViewController.swift
//  Pneumask
//
//  Created by James Dale on 15/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let audio = AudioController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try audio.start()
        } catch {
            fatalError("Unable to start audio engine. Remove this for production.")
        }
        
    }

}

