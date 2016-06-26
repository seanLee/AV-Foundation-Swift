//
//  AudioManager.swift
//  AV_Foudation-Swift
//
//  Created by Sean on 16/6/25.
//  Copyright © 2016年 sean. All rights reserved.
//

import AVFoundation

class AudioManager: AVAudioSession {
    static let shareManager: AudioManager = AudioManager()
    var player : AVAudioPlayer!
    
    class func setup() {
        do {
            try self.shareManager.setCategory(AVAudioSessionCategoryPlayback)
        } catch {
            print(error)
        }
        
        do {
            try self.shareManager.setActive(true)
        } catch {
            print(error)
        }
    }
//    
//    func playAudio(path: NSURL) {
//        do {
//            player = try AVAudioPlayer(contentsOfURL: path)
//            player.prepareToPlay()
//            player.play()
//        } catch {
//            print("AVAudioPlayer is not initializ")
//        }
//    }
}
