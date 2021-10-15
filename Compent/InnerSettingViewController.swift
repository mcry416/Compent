//
//  InnerSettingViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/14.
//

import UIKit

class InnerSettingViewController: BaseViewController {
    
    let userDefaults = UserDefaults.standard
    
    private func initData(){
        print("------> Text Field(User Name):\(userDefaults.string(forKey: "set_text_field"))")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initData()
    }

}
