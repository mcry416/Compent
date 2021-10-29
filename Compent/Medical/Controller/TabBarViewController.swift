//
//  TabBarViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private func initView(){
        let medOneVC = MedOneViewController()
        medOneVC.title = "One"
        medOneVC.tabBarItem.image = UIImage(named: "med_home")
        self.addChild(medOneVC)
        
        let medTwoVC = MedTwoViewController()
        medTwoVC.title = "Two"
        medTwoVC.tabBarItem.image = UIImage(named: "med_more")
        self.addChild(medTwoVC)
        
        self.selectedIndex = 0

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

}
