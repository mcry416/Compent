//
//  MedOneView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit
import SnapKit

class MedOneView: UIView {
    
    var backButton: UIButton!
    var pausePlaybutton: UIButton!
    var forwardButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
            
        installButtonGroup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func installButtonGroup(){
        backButton = UIButton(type: .custom)
        pausePlaybutton = UIButton(type: .custom)
        forwardButton = UIButton(type: .custom)
        
        backButton.setImage(UIImage(named: "backward"), for: .normal)
        backButton.setImage(UIImage(named: "pause"), for: UIControl.State.highlighted)
        pausePlaybutton.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        forwardButton.setImage(UIImage(named: "forward2"), for: UIControl.State.normal)
        
        self.addSubview(backButton)
        self.addSubview(pausePlaybutton)
        self.addSubview(forwardButton)
        
        backButton.frame = CGRect(x: 20, y: self.frame.height - 40, width: 32, height: 32)
        pausePlaybutton.frame = CGRect(x: (self.frame.width / 2) - 16, y: (self.frame.height - 40), width: 32, height: 32)
        forwardButton.frame = CGRect(x: self.frame.width - 52, y: self.frame.height - 40, width: 32, height: 32)
    }
}
