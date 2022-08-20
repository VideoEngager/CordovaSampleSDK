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
        SmartVideo.delegate = self
        SmartVideo.setLogging(level: .verbose, types: [.all])
        SmartVideo.connect(engine: engine, isVideo: video, lang: lang)
    }
}

extension SmartVideoCordova: SmartVideoDelegate {
    
    func failedEstablishCommunicationChannel(type: SmartVideoCommunicationChannelType) {
    }
    
    func didEstablishCommunicationChannel(type: SmartVideoCommunicationChannelType) {
        let outgoingCallVC = OutgoingCallVC()
//        outgoingCallVC.hasVideo = self.hasVideo
        outgoingCallVC.modalPresentationStyle = .fullScreen
        self.viewController.present(outgoingCallVC, animated: true, completion: nil)
    }
    
    func callStatusChanged(status: SmartVideoCallStatus) {
        
    }
    
    func isConnectedToInternet(isConnected: Bool) {
    }
    
    func errorHandler(error: SmartVideoError) {
    }
    
    func onAgentTimeout() -> Bool {
        return true
    }
    
    func peerConnectionLost() {
        
    }
}

