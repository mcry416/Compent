//
//  SpinViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/27.
//

import UIKit
import SnapKit

class SpinViewController: BaseViewController {
    
    var playerView: UIView!
    var fullScreenButton: UIButton!
    
    private func initView(){
        playerView = UIView()
        playerView.backgroundColor = UIColor.systemBlue
        self.view.addSubview(playerView)
        
        fullScreenButton = UIButton(type: UIButton.ButtonType.custom)
        fullScreenButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        fullScreenButton.setTitle("Full", for: UIControl.State.normal)
        fullScreenButton.addTarget(self, action: #selector(fullListener), for: UIControl.Event.touchDown)
        self.playerView.addSubview(fullScreenButton)
        
        playerView.snp.makeConstraints{ make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(UIScreen.main.bounds.width / 2)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        fullScreenButton.snp.makeConstraints{ make in
            make.size.equalTo(40)
            make.right.equalTo(self.playerView.snp.right).offset(-15)
            make.bottom.equalTo(self.playerView.snp.bottom).offset(-15)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
        
    // MARK: - Event.
    @objc func fullListener(){
        UIView.animate(withDuration: 0.5) {
            self.playerView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
            self.playerView.frame.size = self.view.frame.size
            self.playerView.center = self.view.center
            
     //       self.fullScreenButton.frame = CGRect(x: 50, y: 700, width: 50, height: 50)

        }

        self.fullScreenButton.frame = CGRect(x: 50, y: 1000, width: 50, height: 50)
        
    }
    
    
}
