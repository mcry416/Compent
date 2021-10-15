//
//  NationalViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/11.
//

import UIKit

class NationalViewController: BaseViewController {
    
    var labelLogin: UILabel!
    var labelRegister: UILabel!
    
    var labelWidth: UILabel!
    
    private func initView(){
        labelLogin = UILabel(frame: CGRect(x: self.view.frame.width / 2, y: 100, width: 60, height: 27))
        labelRegister = UILabel(frame: CGRect(x: self.view.frame.width / 2, y: 130, width: 60, height: 27))
        self.view.addSubview(labelLogin)
        self.view.addSubview(labelRegister)
        labelLogin.text = NSLocalizedString("LOGIN", comment: "Login")
        labelRegister.text = NSLocalizedString("REGISTER", comment: "Register")

    }
    
    private func testWidth(){
        labelWidth = UILabel()
        labelWidth.text = "中国"
        labelWidth.sizeToFit()
        print("------> WIDTH:\(labelWidth.frame.width)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
     //   testWidth()
        
        print("------> Apple:\(self.getSentenceWidth(sentence: "Apple"))")
        print("------> iphone!:\(self.getSentenceWidth(sentence: "iphone!"))")
        print("------> 多媒体:\(self.getSentenceWidth(sentence: "多媒体"))")
        print("------> (包含):\(self.getSentenceWidth(sentence: "(包含)"))")
        let image = #imageLiteral(resourceName: "ef")
    }


}

extension BaseViewController{
    
    public func getSentenceWidth(sentence: String) -> Int{
        let labelWidth = UILabel()
        labelWidth.text = sentence
        labelWidth.sizeToFit()
        return Int(labelWidth.frame.width)
    }
}
