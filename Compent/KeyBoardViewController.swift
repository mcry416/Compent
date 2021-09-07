//
//  KeyBoardViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/8/22.
//

import UIKit

class KeyBoardViewController: BaseViewController, UITextFieldDelegate, KeyBoardViewProtocol {
    
    func sentData(_ data: String) {
        self.textField?.text = data
    }
    
    private var textField: UITextField!
    private var tempString: String = ""
    private var mKeyBoardView: MyKeyBoardView!
    
    private func initView(){
        textField = UITextField(frame: CGRect(x: 10, y: 200, width: (Int(self.view.frame.width) - 20), height: 45))
        textField.borderStyle = .bezel
        textField.delegate = self
        self.view.addSubview(textField)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let keyBoardView = MyKeyBoardView(frame: CGRect(x: 0, y: self.view.frame.height - 277, width: self.view.frame.width, height: 277))
        mKeyBoardView = keyBoardView
        keyBoardView.delegate = self
        tempString = keyBoardView.tempString
        keyBoardView.becomeFirstResponder()
        self.textField.inputView = keyBoardView
        keyBoardView.show()
        
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.text = tempString
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mKeyBoardView.resignFirstResponder()
        mKeyBoardView.dismissView()
        return true
    }

}
