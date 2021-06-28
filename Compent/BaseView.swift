//
//  BaseView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/25.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    var backButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfig()
        
        installBackButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init configuration.
    private func initConfig(){
        self.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
    }
    
    // MARK: - Install widget.
    private func installBackButton(){
        backButton = UIButton(type: .custom)
        backButton.setBackgroundImage(UIImage(named: "close"), for: UIControl.State.normal)
        self.addSubview(backButton)
        
        backButton.snp.makeConstraints{ make in
            make.size.equalTo(20)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(self.snp.left).offset(25)
        }
    }

}
