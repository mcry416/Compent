//
//  PaintViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/8/27.
//

import UIKit
import SnapKit

class PaintViewController: BaseViewController {
    
    private func initView(){
        let paint1 = PaintView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        self.view.addSubview(paint1)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

}
