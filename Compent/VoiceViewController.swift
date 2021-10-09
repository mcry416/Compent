//
//  VoiceViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/28.
//

import UIKit
import AVFoundation

class VoiceViewController: BaseViewController, AVSpeechSynthesizerDelegate {
    
    let syntesizer = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance()
    
    var playButton: UIButton!
    var pasueButton: UIButton!
    
    private func initView(){
        playButton = UIButton(type: .system)
        playButton.setTitle("Play", for: UIControl.State.normal)
        playButton.frame = CGRect(x: (self.view.frame.width / 2) - 25, y: 60, width: 50, height: 25)
        playButton.addTarget(self, action: #selector(playListener), for: UIControl.Event.touchDown)
        self.view.addSubview(playButton)
        
        pasueButton = UIButton(type: .system)
        pasueButton.setTitle("Pause", for: UIControl.State.normal)
        pasueButton.frame = CGRect(x: (self.view.frame.width / 2) - 25, y: (60 + 38), width: 50, height: 25)
        pasueButton.addTarget(self, action: #selector(pauseListener), for: UIControl.Event.touchDown)
        self.view.addSubview(pasueButton)
        
        syntesizer.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    @objc func playListener(){
        let voiceStr: String = "Welcome to use Swift to code software. Swift is a moden and safe and effiency language, with more fantastic features, enginer could work with this and create so many amazing arts, such as NLP product ,which is based on CoreML, and funny games with SpritKit."
        let voiceChinesStr = "欢迎来到Swift编程世界。在这里你可以开发出各种令人惊叹的像艺术品的工程。"
        utterance = AVSpeechUtterance(string: voiceChinesStr)
        utterance.voice = AVSpeechSynthesisVoice.init(language: "zh_CN")!
        utterance.rate = 0.46
        syntesizer.speak(utterance)

    }
    
    @objc func pauseListener(){
        syntesizer.pauseSpeaking(at: .immediate)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("-----> START.")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        print("-----> PAUSE.")
    }

}
