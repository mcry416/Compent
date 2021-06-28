//
//  Business1ViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/25.
//

import UIKit

class Business1ViewController: BaseViewController {
    
    var clickButton: UIButton!
    
    private func initView(){
        clickButton = UIButton(type: UIButton.ButtonType.system)
        clickButton.setTitle("Click", for: UIControl.State.normal)
        clickButton.frame = CGRect(x: (self.view.frame.width / 2), y: (self.view.frame.height / 2), width: 70, height: 35)
        clickButton.addTarget(self, action: #selector(clickListenenr), for: UIControl.Event.touchDown)
        self.view.addSubview(clickButton)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    @objc func clickListenenr(){
        let vc = Business2ViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
