//
//  AnimationViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/9/3.
//

import UIKit
import SnapKit

class AnimationViewController: BaseViewController {
    
    private var animationView: UIView!
    private var buttonChange:  UIButton!
    private var imageView: UIImageView!
    
    private func initView(){
        animationView = UIView()
        animationView.backgroundColor = UIColor.gray
        self.view.addSubview(animationView)
        
        buttonChange = UIButton(type: UIButton.ButtonType.system)
        buttonChange.setTitle("Change", for: UIControl.State.normal)
        buttonChange.addTarget(self, action: #selector(animatingViewListener), for: UIControl.Event.touchDown)
        self.view.addSubview(buttonChange)
        
        animationView.snp.makeConstraints{ make in
            make.size.equalTo(230)
            make.center.equalToSuperview()
        }
        
        buttonChange.snp.makeConstraints{ make in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-80)
            make.centerX.equalToSuperview()
        }
        
        imageView = UIImageView(frame: CGRect(x: (self.view.frame.width / 2) - 25, y: 44, width: 50, height: 50))
        
        // MARK: -- Bundle resource.
        imageView.image = UIImage(named: "PicCenter.bundle/Contents/Resources/ef.png")
        self.view.addSubview(imageView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
    }
    
    /*
    @objc func animatingViewListener(){
        UIView.animate(withDuration: 1, animations: {
            self.animationView.backgroundColor = UIColor.red
        }) {(finish) in
            UIView.animate(withDuration: 1, animations: {
                self.animationView.center = CGPoint(x: 200, y: 200)
            })
            
        }
        
    }
 */
    
    /*
    @objc func animatingViewListener(){
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.animationView.center = CGPoint(x: 200, y: 200)
        }, completion: nil)
        
    }
 */
    /*
    @objc func animatingViewListener(){
        UIView.transition(with: self.animationView, duration: 2, options: UIView.AnimationOptions.transitionCurlUp, animations: {
            self.animationView.backgroundColor = UIColor.red
        }, completion: nil)
        
    }
 */
    
    /*
    @objc func animatingViewListener(){
        
        UIView.transition(with: self.animationView, duration: 2, options: UIView.AnimationOptions.transitionCurlUp, animations: {
            self.animationView.backgroundColor = UIColor.red
        }, completion: nil)
        
    }
 */
    @objc func animatingViewListener(){

        
    }

}
