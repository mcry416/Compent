//
//  MyKeyBoardView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/8/23.
//

import UIKit
import SnapKit

class MyKeyBoardView: UIView {
    public var delegate: KeyBoardViewProtocol?
    
    // MARK: - Global variables.
    var WIDTH: Int = Int(UIScreen.main.bounds.size.width)
    var HEIGHT: Int = Int(UIScreen.main.bounds.size.height)
    var keyBoardTitles: Array<String> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "Del"]
    var tempString: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfig()
        
        installKeyButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init configuration.
    private func initConfig(){
        self.backgroundColor = UIColor(red: 0.99, green: 0.99, blue: 0.998, alpha: 1.0)
    }
    
    // MARK: - Install widget.
    private func installKeyButton(){
        var fowardButtonArray: Array<UIButton> = Array<UIButton>()
        
        //  Create custom button type.
        for i in 0..<12 {
            let button = UIButton(type: .system)
            button.tag = i
            button.addTarget(self, action: #selector(buttonEvent(button:)), for: UIControl.Event.touchDown)
            button.isEnabled = true
            button.isUserInteractionEnabled = true
            button.titleLabel?.font = .boldSystemFont(ofSize: 21)
            button.setTitleColor(UIColor.black, for: UIControl.State.normal)
            button.setTitle(keyBoardTitles[i], for: UIControl.State.normal)
            
            // Put the index of every cow's last position.
            // It's meanning of next cow's top equals foward cow's UIButton's bottom.
            if (i == 2) || (i == 5) || (i == 8) || (i == 11){
                fowardButtonArray.append(button)
            }
            
            self.addSubview(button)
            
            // Judgement if the button is licated in keyboard matrix.
            if (i == 0) || (i == 3) || (i == 6) || (i == 9){
                
                // If keyboard of button is not located in first cow.
                if (i == 3) || (i == 6) || (i == 9) {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.left.equalTo(self.snp.left).offset(5)
                        make.top.equalTo(fowardButtonArray[returnIndex(index: i)].snp.bottom).offset(30)
                    }
                } else {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.left.equalTo(self.snp.left).offset(5)
                    }
                }
            } else if (i == 1) || (i == 4) || (i == 7) || (i == 10){

                // If keyboard of button is not located in first cow.
                if (i == 4) || (i == 7) || (i == 10) {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.centerX.equalToSuperview()
                        make.top.equalTo(fowardButtonArray[returnIndex(index: i)].snp.bottom).offset(30)
                    }
                } else {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.centerX.equalToSuperview()
                    }
                }
            } else if (i == 2) || (i == 5) || (i == 8) || (i == 11){
                // If keyboard of button is not located in first cow.
                if (i == 5) || (i == 8) || (i == 11) {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.right.equalTo(self.snp.right).offset(-5)
                        make.top.equalTo(fowardButtonArray[returnIndex(index: i)].snp.bottom).offset(30)
                    }
                } else {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.right.equalTo(self.snp.right).offset(-5)
                    }
                }
            }
            
        }
    }
    
    // MARK: - Business block.
    // Return a concrete cow index by colum index.
    private func returnIndex(index: Int) -> Int{
        if (index == 3) || (index == 4) || (index == 5) {
            return 0
        } else if (index == 6) || (index == 7) || (index == 8) {
            return 1
        } else if (index == 9) || (index == 10) || (index == 11) {
            return 2
        } else {
            return 0
        }
    }
    
    // According to buttons's tag (parameter is index) to return KeyBoard's real content in the
    // world.
    private func returnContent(index: Int) -> String{
        switch index {
        case 0:
            return "1"
        case 1:
            return "2"
        case 2:
            return "3"
        case 3:
            return "4"
        case 4:
            return "5"
        case 5:
            return "6"
        case 6:
            return "7"
        case 7:
            return "8"
        case 8:
            return "9"
        case 9:
            return "*"
        case 10:
            return "0"
        case 11:
            return "del"
        default:
            return ""
        }
    }
    
    // MARK: - Event block.
    @objc func show(){
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.55, animations: {
            self.alpha = 1.0
            self.center = CGPoint(x: (Int(self.frame.width) / 2), y: self.HEIGHT - 138)
        })
    }
    
    @objc func dismissView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (true) in
            self.removeFromSuperview()
        }
    }
    
    @objc func buttonEvent(button: UIButton){
        // If touch down the DEL button.
        if button.tag == 11 {
            // If currently tempString's count equals 0 and which means tempString should not
            // call the menthod of removeLast().
            if tempString.count != 0 {
                tempString.removeLast()
                delegate?.sentData(tempString)
            }
        } else {
            tempString.append(returnContent(index: button.tag))
            delegate?.sentData(tempString)
        }
    }

}

// MARK: - Protocol block.
protocol KeyBoardViewProtocol {
    func sentData(_ data: String)
}
