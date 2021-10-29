//
//  SpinViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import UIKit
import Foundation
import SnapKit
import AVKit
import AVFoundation

class SpinViewController: BaseViewController {
    
    var playerView: UIView!
    var fullScreenButton: UIButton!
    var isFullscreen = false
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var playerItem: AVPlayerItem!
    var slider: UISlider!
    var isPlaySingal: Int = 0
    var timeOb: Any!
    
    // MARK: - Init.
    private func initView(){
        playerView = UIView(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: (self.view.frame.width / 2)))
        playerView.backgroundColor = UIColor.black
        self.view.addSubview(playerView)
        
  //      let filePath = Bundle.main.path(forResource: "VIDEO_1", ofType: "mp4")
  //      let videoURL = URL(fileURLWithPath: filePath!)
        let videoURL = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
        playerItem = AVPlayerItem(url: videoURL)
        
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: (self.view.frame.width / 2))
        self.playerView.layer.addSublayer(playerLayer)
        
        slider = UISlider(frame: CGRect(x: 0, y: self.playerView.frame.height - 3, width: self.playerView.frame.width, height: 3))
        slider.center.x = self.playerView.center.x
        slider.maximumValue = 100
        slider.minimumValue = 0
  //      slider.tintColor = .systemPink
        self.playerView.addSubview(slider)
        
        fullScreenButton = UIButton(type: UIButton.ButtonType.custom)
        fullScreenButton.setImage(UIImage(named: "fullscreen"), for: UIControl.State.normal)
        fullScreenButton.setImage(UIImage(named: "fullscreen_select"), for: UIControl.State.highlighted)
        fullScreenButton.addTarget(self, action: #selector(fullListener), for: UIControl.Event.touchDown)
        self.playerView.addSubview(fullScreenButton)
        

        fullScreenButton.frame = CGRect(x: (self.playerView.frame.width - 50), y: (self.playerView.frame.height - 50), width: 40, height: 40)

    }
    
    // MARK: - KVO.
    private func notifService(){
        self.playerItem.addObserver(self, forKeyPath: "loadedTimeRanges", options:.new ,context: nil)
        
    }

    // MARK: - Life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        notifService()
        addProgressObserver()
        
    }
    
    deinit {
        self.player.removeTimeObserver(timeOb)
    }
        
    // MARK: - Event.
    @objc func fullListener(){
        
        // From fullscreen to normal status.
        if isFullscreen {
            UIView.animate(withDuration: 0.5) {
                self.playerView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 1 + Double.pi / 1))
                self.playerView.frame = CGRect(x: 0, y: 44, width: self.view.frame.width, height: (self.view.frame.width / 2))

                self.fullScreenButton.frame = CGRect(x: (self.playerView.frame.width - 50), y: (self.playerView.frame.height - 50), width: 40, height: 40)
                
  //              self.imageView.frame = CGRect(x: 0, y: 0, width: self.playerView.frame.width, height: self.playerView.frame.height)
                self.playerLayer.frame = CGRect(x: 0, y: 0, width: self.playerView.frame.width, height: self.playerView.frame.height)
                self.slider.frame = CGRect(x: 0, y: self.playerView.frame.height - 3, width: self.playerView.frame.width, height: 3)
            }
            isFullscreen = false
            
            return
        }
        // From normal to fullscreen status.
        if !isFullscreen {
            UIView.animate(withDuration: 0.5) {
                self.playerView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
                self.playerView.frame.size = self.view.frame.size
                self.playerView.center = self.view.center

                self.fullScreenButton.frame = CGRect(x: (self.playerView.frame.height - 70), y: (self.playerView.frame.width - 70), width: 50, height: 50)
                
                /// Root spin, so the subview ought to use adverse width and height.
       //         self.imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.height, height: self.view.frame.width)
                self.playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.height, height: self.view.frame.width)
                self.slider.frame = CGRect(x: 25, y: self.playerView.frame.width - 20, width: self.view.frame.height, height: 3)
            }
            
            isFullscreen = true
            
            return
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //    self.dismiss(animated: true, completion: nil)
        isPlaySingal = isPlaySingal + 1
        
        if (isPlaySingal % 2) == 0  {
            self.player.play()
        }
        if (isPlaySingal % 2) != 0  {
            self.player.pause()
        }
        
    }

    // MARK: - Observer override.
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loadedTimeRanges" {
            /*
            let array = self.playerItem.loadedTimeRanges
            let timeInterval = CMTimeGetSeconds(array.first!.timeRangeValue.start)
            let duration = self.playerItem!.asset.duration
            let totalDuration = CMTimeGetSeconds(duration)
            print("------> \(totalDuration)")
            print("------> NOW: \(timeInterval / totalDuration)")
*/
        }
    }
    
    private func addProgressObserver(){
        let progressObserver = player.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 30), queue: nil) { (cmtime) in
            let progress = (cmtime.seconds) / CMTimeGetSeconds(self.player.currentItem!.duration)
            let rate = Float(progress).roundTo(places: 3)
            self.slider.value = rate * 100
            print("------> Progress:\(rate)")
        }
        timeOb = progressObserver
    }
}

extension Float {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }

}
