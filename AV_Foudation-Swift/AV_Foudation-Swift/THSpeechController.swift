//
//  THSpeechController.swift
//  AV_Foudation-Swift
//
//  Created by sean on 16/5/23.
//  Copyright © 2016年 sean. All rights reserved.
//

import UIKit
import AVFoundation

class THSpeechController: UIViewController {
    var player : AVAudioPlayer!

    lazy var synthesizer = AVSpeechSynthesizer()
    //播放中文语音
    lazy var voices = [AVSpeechSynthesisVoice(language: "zh-CN"),
                  AVSpeechSynthesisVoice(language: "zh-HK")]
    lazy var speechString = ["有陣子沒有進組拍戲，以樂作人生專輯、巡演把時間填滿。","最近總在清晨早起，一到車上迎接我的是生意盎然的鮮花，開始一天的工作，心情也因花花草草而有幸福感，隨手點開想聽的音樂，享受著忙碌前的五分鐘。","這位司機大哥是能人，手巧、心細、常常閱讀...，他可以沿著公路、山路，在荒野間去尋找植物和花朵，特色的或平凡的，他憑直覺佈好花草，看起來就是一門藝術啊！","在感動之餘，也會隨口幾句研究今日花草"]
    //播放英文语音
//    let voices = [AVSpeechSynthesisVoice(language: "en-GB"),
//                  AVSpeechSynthesisVoice(language: "en-US")]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //获取系统支持的所有语音语言
//        for voice in AVSpeechSynthesisVoice.speechVoices() {
//            print(voice.language)
//        }
//        beginReading()
        let playUrl = NSBundle.mainBundle().URLForResource("Mika - Relax, Take It Easy", withExtension: "mp3")
        if let playUrl = playUrl {
            do {
                player = try AVAudioPlayer(contentsOfURL: playUrl)
                
                NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(handleRouteChanged(_:)), name: AVAudioSessionRouteChangeNotification, object: AVAudioSession.sharedInstance())
                
                player.volume = 1.0
                player.pan = -1.0
                player.prepareToPlay()
                player.play()
            } catch {
                print("AVAudioPlayer is not initializ")
            }
        }
    }
    
    @objc private func handleRouteChanged(not: NSNotification) {
        print(not.userInfo)
    }
    
    private func beginReading() {
        for readingText in speechString {
            let utterance = AVSpeechUtterance(string: readingText)
            utterance.voice = voices[Int(arc4random() % 2)]
            utterance.rate = 0.4
            utterance.pitchMultiplier = 0.8
            utterance.postUtteranceDelay = 0.5
            synthesizer.speakUtterance(utterance)
        }
    }
}
