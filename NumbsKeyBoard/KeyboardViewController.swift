//
//  KeyboardViewController.swift
//  NumbsKeyBoard
//
//  Created by Eldest's MacBook on 2021/8/24.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    // MARK: - Commen variables.
    var WIDTH: Int = Int(UIScreen.main.bounds.size.width)
    var HEIGHT: Int = Int(UIScreen.main.bounds.size.height)
    var keyBoardTitles: Array<String> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "Del"]
    var tempString: String = ""
    var textField: UITextField!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        installWidget()
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    // MARK: - View block.
    func installWidget(){
        addNextKeyBoard()
        installWidget()
    }
    
    func addNextKeyBoard(){
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    /*
    // MARK: - Install widget.
    private func installKeyButton(){
        var fowardButtonArray: Array<UIButton> = Array<UIButton>()
        
        //  Create self-define button type.
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
            
            self.view.addSubview(button)
            
            // Judgement if the button is licated in keyboard matrix.
            if (i == 0) || (i == 3) || (i == 6) || (i == 9){
                
                // If keyboard of button is not located in first cow.
                if (i == 3) || (i == 6) || (i == 9) {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.left.equalTo(self.view.snp.left).offset(5)
                        make.top.equalTo(fowardButtonArray[returnIndex(index: i)].snp.bottom).offset(30)
                    }
                } else {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.left.equalTo(self.view.snp.left).offset(5)
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
                        make.right.equalTo(self.view.snp.right).offset(-5)
                        make.top.equalTo(fowardButtonArray[returnIndex(index: i)].snp.bottom).offset(30)
                    }
                } else {
                    button.snp.makeConstraints{ make in
                        make.width.equalTo((WIDTH / 3) - 60)
                        make.height.equalTo(40)
                        make.right.equalTo(self.view.snp.right).offset(-5)
                    }
                }
            }
            
        }
 
    }
 */
    
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
    @objc func buttonEvent(button: UIButton){
        // If have not touch down the button firstly, but DEL button do this.
        if tempString.count == 0 {
        
        } else {
            // If touch down the DEL button.
            if button.tag == 11 {
                tempString.removeLast()
            } else {
                tempString.append(returnContent(index: button.tag))
                textField.text = tempString
            }
            print("------> \(tempString)")
        }
    }

}
