//
//  MedOneViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit
import AVKit
import AVFoundation

class MedOneViewController: UIViewController {
    
    var medOneView: MedOneView!
    var player: AVPlayer!
    var playerItem: AVPlayerItem!
    var signalPlay = true
    
    private func initView(){
        let filePath = Bundle.main.path(forResource: "IMG_5815", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
  //      let videoURL = URL(string: "http://player.youku.com/embed/XMjczNDgzMTgxMg")!
        playerItem = AVPlayerItem(url: videoURL)
        NotificationCenter.default.addObserver(self, selector: #selector(playToEndTime), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        

        player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 180)
        self.view.layer.addSublayer(playerLayer)
        
        medOneView = MedOneView(frame: CGRect(x: 0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 100))
        self.view.addSubview(medOneView)
        
        medOneView.backButton.addTarget(self, action: #selector(backListener), for: UIControl.Event.touchDown)
        medOneView.pausePlaybutton.addTarget(self, action: #selector(pausePlayListener), for: UIControl.Event.touchDown)
        medOneView.forwardButton.addTarget(self, action: #selector(forwardListener), for: UIControl.Event.touchDown)
    }
    
    private func initConfig(){
        self.title = "Home"
    }
    
    private func initData(){
        
    }

    // MARK: - Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        initConfig()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(VideoViewController(), animated: true)
    }
    
    // MARK: - Event.
    @objc func backListener(){
        let currentTime = Int(self.playerItem.currentTime().value) / Int(self.playerItem.currentTime().timescale)
        let shouldTime = CMTime(seconds: Double(currentTime - 3), preferredTimescale: 1)
        self.player.seek(to: shouldTime)
        
    }
    
    @objc func forwardListener(){
        let currentTime = Int(self.playerItem.currentTime().value) / Int(self.playerItem.currentTime().timescale)
        let shouldTime = CMTime(seconds: Double(currentTime + 3), preferredTimescale: 1)
        self.player.seek(to: shouldTime)
    }
    
    @objc func pausePlayListener(){
        if signalPlay {
            self.player.play()
        } else if !signalPlay{
            self.player.pause()
        }
    }
    
    @objc func playToEndTime(){
        print("Play end.")
    }
    
}
