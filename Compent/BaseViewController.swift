//
//  BaseViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    var baseView: BaseView!
    
    private func initView(){
        baseView = BaseView(frame: self.view.frame)
        self.view.addSubview(baseView)
        
        baseView.backButton.addTarget(self, action: #selector(backListener), for: UIControl.Event.touchDown)
    }
    
    private func simulateCheckStatus(){
        NSLog("LAUNCH...")
        print("------> \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
        
        simulateCheckStatus()
    }
    
    // MARK: - Simulator method.
    @objc func backListener(){
        self.dismiss(animated: true, completion: nil)
    }

}
