//
//  Business2ViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/25.
//

import UIKit

class Business2ViewController: BaseViewController {
    
    var imageView: UIImageView!
    
    private func initView(){
        imageView = UIImageView()
        imageView.image = UIImage(named: "taylor")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.focusOnFaces = true
        imageView.frame = CGRect(x: (self.view.frame.width / 2) - 75, y: (self.view.frame.width / 2) - 75, width: 150, height: 150)
        self.view.addSubview(imageView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

}
