//
//  ViewController.swift
//  Pneumask
//
//  Created by James Dale on 15/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import UIKit

final class MainViewController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
    }

}

