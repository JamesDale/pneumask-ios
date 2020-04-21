//
//  ViewController.swift
//  Pneumask
//
//  Created by James Dale on 15/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import SafariServices
import UIKit

protocol MainCollectionViewCell: UICollectionViewCell {
  static var reuseIdentifier: String { get }
}

final class MainViewController: UICollectionViewController {

  enum Item: CaseIterable {
    case experience
    case resources
    case disclaimer
    case amplifier

    var cellType: MainCollectionViewCell.Type {
      switch self {
      case .experience:
        return ExperienceCollectionViewCell.self
      case .resources:
        return ResourcesCollectionViewCell.self
      case .disclaimer:
        return DisclaimerCollectionViewCell.self
      case .amplifier:
        return AmplifierCollectionViewCell.self
      }
    }
  }

  private var items: [Item] = [.experience, .resources, .disclaimer]

  init() {
    super.init(collectionViewLayout: MainViewController.createLayout())
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .secondarySystemBackground

    Item.allCases.forEach {
      collectionView.register(
        $0.cellType,
        forCellWithReuseIdentifier: $0.cellType.reuseIdentifier)
    }
  }

  static func createLayout() -> UICollectionViewLayout {
    UICollectionViewCompositionalLayout {
      (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment)
        -> NSCollectionLayoutSection? in

      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .estimated(40))

      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .estimated(400))

      let group: NSCollectionLayoutGroup = .vertical(
        layoutSize: groupSize,
        subitems: [item])

      let section = NSCollectionLayoutSection(group: group)
      section.contentInsets = NSDirectionalEdgeInsets(
        top: 20,
        leading: 20,
        bottom: 20,
        trailing: 20)
      section.interGroupSpacing = 20
      return section
    }
  }

}

extension MainViewController {

  override func collectionView(
    _ collectionView: UICollectionView, numberOfItemsInSection section: Int
  ) -> Int {
    items.count
  }

  override func collectionView(
    _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let item = items[indexPath.item]
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: item.cellType.reuseIdentifier,
      for: indexPath)

    if let resourcesCell = cell as? ResourcesCollectionViewCell {
      resourcesCell.delegate = self
    }

    return cell
  }
}

extension MainViewController: ResourceCollectionViewCellDelegate {
  func resourceSelected(_ resource: Resource) {
    guard let url = resource.url else { return }
    let sfVC = SFSafariViewController(url: url)
    present(sfVC, animated: true)
  }
}
