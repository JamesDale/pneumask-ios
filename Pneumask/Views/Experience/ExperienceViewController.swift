//
//  ExperienceViewController.swift
//  Pneumask
//
//  Created by James Dale on 23/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import ARKit
import SafariServices
import UIKit

final class ExperienceViewController: UIViewController {

  let sceneView = ARSCNView()
  let infoView = ExperienceInfoView()

  init() {
    super.init(nibName: nil, bundle: nil)

    view.addSubview(sceneView)
    view.addSubview(infoView)

    sceneView.session.delegate = self
    sceneView.delegate = self

    updateViewConstraints()
  }

  override func viewDidLoad() {
    resetTracking()

    // Style 1
    infoView.closeBtn.addTarget(
      self,
      action: #selector(closeBtnTap(sender:)),
      for: .touchUpInside)
    
    // Style 2
    infoView.closeBtn.addTarget(self,
                                action: #selector(closeBtnTap(sender:)),
                                for: .touchUpInside)
    
    // Style 3
    infoView.closeBtn.addTarget( self, action: #selector(closeBtnTap(sender:)), for: .touchUpInside)

    
    
    infoView.supportBtn.addTarget(
      self,
      action: #selector(supportBtnTap(sender:)),
      for: .touchUpInside)
  }

  func resetTracking() {
    guard ARFaceTrackingConfiguration.isSupported else { return }
    let configuration = ARFaceTrackingConfiguration()
    configuration.isLightEstimationEnabled = true
    sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func updateViewConstraints() {
    super.updateViewConstraints()

    sceneView.translatesAutoresizingMaskIntoConstraints = false
    infoView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      sceneView.topAnchor.constraint(equalTo: view.topAnchor),
      sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      infoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
      infoView.topAnchor.constraint(lessThanOrEqualTo: view.centerYAnchor, constant: 80),
    ])
  }

  @objc func closeBtnTap(sender: UIButton) {
    dismiss(animated: true)
  }

  @objc func supportBtnTap(sender: UIButton) {
    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    guard let url = Constants.URLs.donate else { return }
    present(SFSafariViewController(url: url), animated: true)
  }
}

extension ExperienceViewController: ARSessionDelegate {

}

extension ExperienceViewController: ARSCNViewDelegate {
  func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
    guard anchor is ARFaceAnchor else { return nil }

    return SCNReferenceNode(named: "PneumaskModel")
  }
}
