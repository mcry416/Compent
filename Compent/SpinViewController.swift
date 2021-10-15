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
    var imageView: UIImageView!
    var fullScreenButton: UIButton!
    var isFullscreen = false
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var playerItem: AVPlayerItem!
    
    private func initView(){
        playerView = UIView(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: (self.view.frame.width / 2)))
        imageView = UIImageView(image: UIImage(named: "video_cap"))
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width / 2)
        playerView.backgroundColor = UIColor.systemBlue
        imageView.contentMode = .scaleToFill
        self.view.addSubview(playerView)
  //      self.playerView.addSubview(imageView)
        
        let filePath = Bundle.main.path(forResource: "VIDEO_1", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
  //      let videoURL = URL(string: "http://player.youku.com/embed/XMjczNDgzMTgxMg")!
        playerItem = AVPlayerItem(url: videoURL)
        
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: (self.view.frame.width / 2))
        self.playerView.layer.addSublayer(playerLayer)
        
        fullScreenButton = UIButton(type: UIButton.ButtonType.custom)
        fullScreenButton.setImage(UIImage(named: "fullscreen"), for: UIControl.State.normal)
        fullScreenButton.setImage(UIImage(named: "fullscreen_select"), for: UIControl.State.highlighted)
        fullScreenButton.addTarget(self, action: #selector(fullListener), for: UIControl.Event.touchDown)
        self.playerView.addSubview(fullScreenButton)
        

        fullScreenButton.frame = CGRect(x: (self.playerView.frame.width - 50), y: (self.playerView.frame.height - 50), width: 40, height: 40)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
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
                self.imageView.frame = self.playerView.frame

                self.fullScreenButton.frame = CGRect(x: (self.playerView.frame.height - 70), y: (self.playerView.frame.width - 70), width: 50, height: 50)
                
                // Root spin, so the subview ought to use adverse width and height.
       //         self.imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.height, height: self.view.frame.width)
                self.playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.height, height: self.view.frame.width)
            }
            
            isFullscreen = true
            
            return
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //    self.dismiss(animated: true, completion: nil)
        self.player.play()
    }
    
    
}
