//
//  MyPopView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/7/16.
//

import Foundation
import UIKit

class MyPopView: UIView{
    
    var contentView: UIView?{
        didSet{
            initView()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Init view.
    func initView(){
        if self.contentView != nil {
            self.contentView?.frame.origin.y = UIScreen.main.bounds.size.height / 2
            self.addSubview(contentView!)
        }
        self.contentView?.layer.cornerRadius = 25
        self.backgroundColor = UIColor.white
        self.isUserInteractionEnabled = true
  //      self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismissView)))
        
        installUIImageView()
        installUIButton()
    }
     
    func installUIImageView(){
        let imageView = UIImageView()
        imageView.frame = CGRect(x: ((self.contentView?.frame.width)! / 2) - 50, y: ((self.contentView?.frame.height)! / 2) - 60, width: 100, height: 100)
        imageView.image = UIImage(named: "ef")
        self.contentView?.addSubview(imageView)
    }
    
    func installUIButton(){
        let button = UIButton(type: .system)
        button.frame = CGRect(x: ((self.contentView?.frame.width)! / 2) - 25, y: ((self.contentView?.frame.height)! / 2) + 55, width: 50, height: 30)
        button.setTitle("Done", for: UIControl.State.normal)
        self.contentView?.addSubview(button)
    }
    
    // MARK: - Event block.
    @objc func show(){
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.35, animations: {
            self.alpha = 1.0
            self.contentView?.frame.origin.y = UIScreen.main.bounds.size.height / 2
        })
    }
    
    @objc func dismissView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (true) in
            self.removeFromSuperview()
            self.contentView?.removeFromSuperview()
        }
    }
}
