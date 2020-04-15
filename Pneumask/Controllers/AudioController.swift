//
//  AudioController.swift
//  Pneumask
//
//  Created by James Dale on 15/4/20.
//  Copyright © 2020 Prakash Lab. All rights reserved.
//

import Foundation
import AVFoundation
import CoreAudio

final class AudioController {
    
    private let engine = AVAudioEngine()
    private let instance = AVAudioSession.sharedInstance()
    
    func start() throws {
        try instance.setMode(.default)
        try instance.setCategory(.playAndRecord, options: [.allowBluetoothA2DP, .allowBluetooth])
        try instance.setActive(true)
        try instance.overrideOutputAudioPort(.speaker)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(outputsChanged),
                                               name: AVAudioSession.routeChangeNotification,
                                               object: nil)
        
        let input = engine.inputNode
        let output = engine.outputNode
        let format = input.inputFormat(forBus: 0)
        
        engine.connect(input, to: output, format: format)
        
        engine.prepare()
        try engine.start()
    }
    
    @objc func outputsChanged(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
            let reason = AVAudioSession.RouteChangeReason.init(rawValue: reasonValue) else { return }
        
        if let previousRoute = userInfo[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription {
            
        }
        
        print("New Route:", instance.currentRoute)
        print("~~~~~~~~~~~~~~~~~~~~~")
    }
    
}
