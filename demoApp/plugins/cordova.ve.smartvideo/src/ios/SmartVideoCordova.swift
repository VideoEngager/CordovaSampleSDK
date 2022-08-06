//
//  SmartVideo.swift
//  
//
//  Created by Slav Sarafski on 15.07.22.
//

import Foundation
import SmartVideoSDK
import AVKit

@objc(SmartVideoCordova) class SmartVideoCordova : CDVPlugin {
    
    @objc(permissions:)
    func permissions(command:CDVInvokedUrlCommand) {
        AVCaptureDevice.requestAccess(for: .video) { response in
            AVAudioSession.sharedInstance().recordPermission()
        }
    }
    
    @objc(toast:)
    func toast(command:CDVInvokedUrlCommand){
        command.arguments.forEach { print($0) }
    }
    
    @objc(videoCall:)
    func videoCall(command:CDVInvokedUrlCommand){
        let engine = GenesysEngine(environment: .live, isVideo: true)
        let lang = "en_US"
        SmartVideo.setLogging(level: .error, types: [.all])
        SmartVideo.connect(engine: engine, isVideo: true, lang: lang)
    }
    
    @objc(audioCall:)
    func audioCall(command:CDVInvokedUrlCommand){
        let engine = GenesysEngine(environment: .live, isVideo: false)
        let lang = "en_US"
        SmartVideo.setLogging(level: .error, types: [.all])
        SmartVideo.connect(engine: engine, isVideo: false, lang: lang)
    }
}
