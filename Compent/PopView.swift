//
//  PopView.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/7/16.
//

import Foundation
import UIKit

class PopView : UIView {
    var selectButtonCallBack:((_ title:String)-> Void)?
     
    var contenView:UIView?
    {
        didSet{
            setUpContent()
        }
    }
     
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
     
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func setUpContent(){
         
        if self.contenView != nil {
            self.contenView?.frame.origin.y = UIScreen.main.bounds.size.height - 191
            self.addSubview(self.contenView!)
        }
        self.backgroundColor = UIColor.gray
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismissView)))
        //以下为添加内容，可根据需要删除以下部分
        sudokuConstraints()
    }
     
    @objc func dismissView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (true) in
            self.removeFromSuperview()
            self.contenView?.removeFromSuperview()
        }
    }
     
    func showInWindow(){
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
            self.contenView?.frame.origin.y = UIScreen.main.bounds.size.height - 191
        }, completion: nil)
    }
     
    //MARK: - 布局
    func sudokuConstraints() -> Void {
        let titleArr = ["京","沪","浙","苏","粤","鲁","晋","翼",
                             "豫","川","渝","辽","吉","黑","皖","鄂",
                             "湘","赣","闽","陕","甘","宁","蒙","津",
                             "贵","云","桂","琼","青","新","藏"]
         
        for (index,value) in titleArr.enumerated() {
            let button = createButton(title: value)
            let margin = (UIScreen.main.bounds.size.width - 8 * 39)/(8 + 1)
            let col  = CGFloat(index % Int(8))
            let row  = CGFloat(index / Int(8))
            let viewX = margin +  col * (39 + margin)
            let viewY = 7 + row * (39 + 7)
             
            button.frame = CGRect(x: viewX, y: viewY, width: 39, height: 39)
            self.contenView!.addSubview(button)
        }
    }
     
    func createButton(title:String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5.0
         
        button.addTarget(self, action: #selector(buttonClickAction(button:)), for: .touchUpInside)
        return button
    }
     
    @objc func buttonClickAction(button:UIButton) -> Void {
        if self.selectButtonCallBack != nil {
            self.selectButtonCallBack!(button.titleLabel?.text ?? "粤")
        }
    }
}
