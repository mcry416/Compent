//
//  MedTwoViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/13.
//

import UIKit

class MedTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "More"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(VideoViewController(), animated: true)
    }
}
