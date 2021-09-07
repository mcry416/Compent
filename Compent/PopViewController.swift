//
//  PopViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/7/14.
//

import UIKit

class PopViewController: UIViewController, UITextFieldDelegate{
    
    private func initView(){
        self.view.backgroundColor = UIColor.white
        
        var textField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        textField.delegate = self
        textField.placeholder = "Input some information."
        
        var imageView = UIImageView(image: UIImage(named: "ef"))
        imageView.frame = CGRect(x: (self.view.frame.width / 2) - 40, y: (self.view.frame.height / 2) + 25, width: 40, height: 40)
        self.view.addSubview(imageView)
        
        self.view.addSubview(textField)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("------> \(textField.text!)")
    }

}
