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
    
    @objc(toast:)
    func toast(command:CDVInvokedUrlCommand){
        command.arguments.forEach { print($0) }
    }
    
    @objc(videoCall:)
    func videoCall(command:CDVInvokedUrlCommand){
        AVCaptureDevice.requestAccess(for: .video) { response in
            AVAudioSession.sharedInstance().requestRecordPermission { _ in
                self.call(video: true)
            }
        }
    }
    
    @objc(audioCall:)
    func audioCall(command:CDVInvokedUrlCommand){
        AVAudioSession.sharedInstance().requestRecordPermission { _ in
            self.call(video: false)
        }
    }
    
    func call(video: Bool) {
        let engine = GenesysEngine(environment: .live, isVideo: video)
        let lang = "en_US"
        SmartVideo.setLogging(level: .error, types: [.all])
        SmartVideo.connect(engine: engine, isVideo: video, lang: lang)
    }
}
