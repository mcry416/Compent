//
//  MoveButtonViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/10/15.
//

import UIKit

class MoveButtonViewController: BaseViewController {
    
    var button: UIButton!
    var breathButton: UIButton!
    
    private func initView(){
        button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 38, height: 38)
        button.center = self.view.center
        button.setImage(UIImage(named: "paint_normal"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "paint_select"), for: UIControl.State.highlighted)
        self.view.addSubview(button)
        
        breathButton = UIButton(type: UIButton.ButtonType.custom)
        breathButton.frame = CGRect(x: (self.view.frame.width / 2) - 25, y: 230, width: 50, height: 50)
        breathButton.backgroundColor = .systemBlue
        breathButton.layer.masksToBounds = true
        breathButton.layer.cornerRadius = 15
        breathButton.layer.shadowColor = UIColor.systemYellow.cgColor
        breathButton.layer.shadowOpacity = 0.8
        breathButton.layer.shadowRadius = 15
        breathButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.view.addSubview(breathButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let x = touches.first?.location(in: self.view).x
//        let y = touches.first?.location(in: self.view).y
//        print("------> X:\(x)")
//        print("------> X:\(y)")
//        self.button.frame = CGRect(x: Int(x!), y: Int(y!), width: 38, height: 38)
        button.setImage(UIImage(named: "paint_select"), for: UIControl.State.normal)
   //     self.breathAction()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let x = touches.first?.location(in: self.view).x
        let y = touches.first?.location(in: self.view).y
        print("------> X:\(x)")
        print("------> X:\(y)")
        self.button.frame = CGRect(x: Int(x!), y: Int(y!), width: 38, height: 38)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        button.setImage(UIImage(named: "paint_normal"), for: UIControl.State.normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        
        /*
        let breathTimer = Timer.scheduledTimer(timeInterval: 5,
                                               target:self,selector:#selector(self.breathAction),
                    userInfo:nil,repeats:true)
        breathTimer.fire()
 */
 
    }
    
    @objc func breathAction(){
        for i in 0..<10 {
            breathButton.frame = CGRect(x: (Int(self.view.frame.width) / 2) - 25, y: 230, width: (50 + i), height: (50 + i))
            breathButton.backgroundColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.8, alpha: CGFloat(i / 10))
            Thread.sleep(forTimeInterval: 0.15)
        }
        
        for i in 0..<10 {
            breathButton.frame = CGRect(x: (Int(self.view.frame.width) / 2) - 25, y: 230, width: (60 - i), height: (60 - i))
            breathButton.backgroundColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.8, alpha: (1 - CGFloat(i / 10) ) )
            Thread.sleep(forTimeInterval: 0.15)
        }
        
        Thread.sleep(forTimeInterval: 0.5)
    }

}
